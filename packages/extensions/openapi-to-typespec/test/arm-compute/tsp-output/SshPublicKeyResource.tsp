import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using Azure.ResourceManager.Foundations;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Compute;
/**
 * Specifies information about the SSH public key.
 */
#suppress "@azure-tools/typespec-azure-core/composition-over-inheritance" "For backward compatibility"
#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "For backward compatibility"
@includeInapplicableMetadataInPayload(false)
model SshPublicKeyResource extends Resource {
  /**
   * The name of the SSH public key.
   */
  @path
  @key("sshPublicKeyName")
  @segment("sshPublicKeys")
  @visibility("read")
  name: string;

  /**
   * Properties of the SSH public key.
   */
  @extension("x-ms-client-flatten", true)
  properties?: SshPublicKeyResourceProperties;
}

@armResourceOperations
interface SshPublicKeyResources {
  /**
   * Retrieves information about an SSH public key.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @operationId("SshPublicKeys_Get")
  get is ArmResourceRead<SshPublicKeyResource>;

  /**
   * Creates a new SSH public key resource.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @operationId("SshPublicKeys_Create")
  create is ArmResourceCreateOrReplaceSync<SshPublicKeyResource>;

  /**
   * Updates a new SSH public key resource.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @parameterVisibility("read")
  @operationId("SshPublicKeys_Update")
  update is ArmCustomPatchSync<
    SshPublicKeyResource,
    SshPublicKeyUpdateResource
  >;

  /**
   * Delete an SSH public key.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @operationId("SshPublicKeys_Delete")
  delete is ArmResourceDeleteSync<SshPublicKeyResource>;

  /**
   * Lists all of the SSH public keys in the specified resource group. Use the nextLink property in the response to get the next page of SSH public keys.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @operationId("SshPublicKeys_ListByResourceGroup")
  listByResourceGroup is ArmResourceListByParent<SshPublicKeyResource>;

  /**
   * Lists all of the SSH public keys in the subscription. Use the nextLink property in the response to get the next page of SSH public keys.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @operationId("SshPublicKeys_ListBySubscription")
  listBySubscription is ArmListBySubscription<SshPublicKeyResource>;

  /**
   * Generates and returns a public/private key pair and populates the SSH public key resource with the public key. The length of the key will be 3072 bits. This operation can only be performed once per SSH public key resource.
   */
  #suppress "@azure-tools/typespec-azure-core/no-operation-id" "For backward compatibility"
  @operationId("SshPublicKeys_GenerateKeyPair")
  generateKeyPair is ArmResourceActionSync<
    SshPublicKeyResource,
    void,
    SshPublicKeyGenerateKeyPairResult
  >;
}

@@projectedName(SshPublicKeyResources.create::parameters.resource,
  "json",
  "parameters"
);
@@extension(SshPublicKeyResources.create::parameters.resource,
  "x-ms-client-name",
  "parameters"
);
@@doc(SshPublicKeyResources.create::parameters.resource,
  "Parameters supplied to create the SSH public key."
);
@@projectedName(SshPublicKeyResources.update::parameters.properties,
  "json",
  "parameters"
);
@@extension(SshPublicKeyResources.update::parameters.properties,
  "x-ms-client-name",
  "parameters"
);
@@doc(SshPublicKeyResources.update::parameters.properties,
  "Parameters supplied to update the SSH public key."
);
