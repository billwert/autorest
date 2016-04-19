/**
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for
 * license information.
 *
 * Code generated by Microsoft (R) AutoRest Code Generator.
 * Changes may cause incorrect behavior and will be lost if the code is
 * regenerated.
 */

package fixtures.custombaseurimoreoptions;

import com.microsoft.rest.ServiceClient;
import com.microsoft.rest.AutoRestBaseUrl;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;

/**
 * Initializes a new instance of the AutoRestParameterizedCustomHostTestClient class.
 */
public final class AutoRestParameterizedCustomHostTestClientImpl extends ServiceClient implements AutoRestParameterizedCustomHostTestClient {
    /**
     * The URL used as the base for all cloud service requests.
     */
    private final AutoRestBaseUrl baseUrl;

    /**
     * Gets the URL used as the base for all cloud service requests.
     *
     * @return The BaseUrl value.
     */
    public AutoRestBaseUrl getBaseUrl() {
        return this.baseUrl;
    }

    /** The subscription id with value 'test12'. */
    private String subscriptionId;

    /**
     * Gets The subscription id with value 'test12'.
     *
     * @return the subscriptionId value.
     */
    public String getSubscriptionId() {
        return this.subscriptionId;
    }

    /**
     * Sets The subscription id with value 'test12'.
     *
     * @param subscriptionId the subscriptionId value.
     */
    public void setSubscriptionId(String subscriptionId) {
        this.subscriptionId = subscriptionId;
    }

    /** A string value that is used as a global part of the parameterized host. Default value 'host'. */
    private String dnsSuffix;

    /**
     * Gets A string value that is used as a global part of the parameterized host. Default value 'host'.
     *
     * @return the dnsSuffix value.
     */
    public String getDnsSuffix() {
        return this.dnsSuffix;
    }

    /**
     * Sets A string value that is used as a global part of the parameterized host. Default value 'host'.
     *
     * @param dnsSuffix the dnsSuffix value.
     */
    public void setDnsSuffix(String dnsSuffix) {
        this.dnsSuffix = dnsSuffix;
    }

    /**
     * Gets the PathsOperations object to access its operations.
     * @return the PathsOperations object.
     */
    public PathsOperations getPathsOperations() {
        return new PathsOperationsImpl(this.retrofitBuilder.client(clientBuilder.build()).build(), this);
    }

    /**
     * Initializes an instance of AutoRestParameterizedCustomHostTestClient client.
     */
    public AutoRestParameterizedCustomHostTestClientImpl() {
        this("{vault}{secret}{dnsSuffix}");
    }

    /**
     * Initializes an instance of AutoRestParameterizedCustomHostTestClient client.
     *
     * @param baseUrl the base URL of the host
     */
    private AutoRestParameterizedCustomHostTestClientImpl(String baseUrl) {
        super();
        this.baseUrl = new AutoRestBaseUrl(baseUrl);
        initialize();
    }

    /**
     * Initializes an instance of AutoRestParameterizedCustomHostTestClient client.
     *
     * @param clientBuilder the builder for building up an {@link OkHttpClient}
     * @param retrofitBuilder the builder for building up a {@link Retrofit}
     */
    public AutoRestParameterizedCustomHostTestClientImpl(OkHttpClient.Builder clientBuilder, Retrofit.Builder retrofitBuilder) {
        super(clientBuilder, retrofitBuilder);
        this.baseUrl = new AutoRestBaseUrl("{vault}{secret}{dnsSuffix}");
        initialize();
    }

    @Override
    protected void initialize() {
        super.initialize();
        this.retrofitBuilder.baseUrl(baseUrl);
    }
}
