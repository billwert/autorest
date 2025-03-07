import { spawnSync } from "child_process";
import { readFileSync } from "fs";
import { readdir } from "fs/promises";
import { join, dirname, extname, resolve } from "path";
import { resolveProject } from "./resolve-root";

export async function generateTypespec(repoRoot: string, folder: string, debug = false) {
  const { path: root } = await resolveProject(__dirname);
  const path = join(root, "test", folder);
  const dir = await readdir(path);
  if (!dir?.length) {
    throw new Error(`No files found in ${path}`);
  }

  const firstSwagger = dir
    .filter((d) => d !== "resources.json")
    .find((f) => f.endsWith(".json") || f.endsWith(".yaml") || f.endsWith(".yml") || f.endsWith(".md"));

  if (!firstSwagger) {
    throw new Error("No swagger file found");
  }

  const swaggerPath = join(path, firstSwagger);
  generate(repoRoot, swaggerPath, debug);
}

function generate(root: string, path: string, debug = false) {
  const extension = extname(path);
  const inputFile = extension === ".json" ? `--input-file=${path}` : `--require=${path}`;

  let overrideGuess = false;
  if (extension === ".md") {
    const fileContent = readFileSync(path, "utf-8");
    overrideGuess = fileContent.includes("guessResourceKey: false");
  }

  const args = [
    resolve(root, "packages/apps/autorest/entrypoints/app.js"),
    "--openapi-to-typespec",
    inputFile,
    "--use=.",
    `--output-folder=${dirname(path)}`,
    "--src-path=tsp-output",
    ...(debug ? ["--openapi-to-typespec.debugger"] : []),
    ...(overrideGuess ? ["--guessResourceKey=false"] : ["--guessResourceKey=true"]),
  ];
  const spawn = spawnSync("node", args, { stdio: "inherit" });

  if (spawn.status !== 0) {
    throw new Error(
      `Generation failed, command:\n autorest ${args.join(" ")}\nStdout:\n${spawn.stdout}\nStderr:\n${spawn.stderr}`,
    );
  }
}

async function main() {
  const folder = process.argv[4];
  const debug = process.argv[5] === "--debug";
  const { path: root } = await resolveProject(__dirname);
  const repoRoot = resolve(root, "..", "..", "..");
  const folders: string[] = folder
    ? [folder as string]
    : (await readdir(join(root, "test"))).filter((d) => d !== "utils");

  for (const folder of folders) {
    try {
      await generateTypespec(repoRoot, folder, debug);
    } catch (e) {
      throw new Error(`Failed to generate ${folder}, error:\n${e}`);
    }
  }
}

main().catch((e) => {
  throw e;
});
