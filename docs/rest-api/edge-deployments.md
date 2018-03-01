description: A detailed look at the various REST actions supported by the Edge Deployments resource of the Losant API. Learn more.

# Edge Deployments Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/edge/deployments

Below are the various requests that can be performed against the
Edge Deployments resource, as well as the expected
parameters and the potential responses.

## Get

Returns the edge deployments for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/edge/deployments

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, edgeDeployments.*, or edgeDeployments.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: id, deviceId, flowId, desiredVersion, currentVersion, creationDate, lastUpdated | lastUpdated | creationDate |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| deviceId | N | Filter deployments to the given Device ID |  | 575ecf887ae143cd83dc4aa2 |
| version | N | Filter deployments to the given Workflow Version (matches against both current and desired) |  | myFlowVersion |
| filterEmpty | N | Filter out deployments where both the current and desired version are null. |  | true |
| flowId | N | Filter deployments to the given Workflow ID |  | 575ed18f7ae143cd83dc4aa6 |

### Request Headers <a name="get-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="get-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/edge/deployments
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Edge Deployments](schemas.md#edge-deployments) | Collection of edge deployments |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Release

Deploy an edge workflow version to one or more edge devices. Version can be blank, if removal is desired.

### Method And Url <a name="release-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/edge/deployments/release

### Authentication <a name="release-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, edgeDeployments.*, or edgeDeployments.release.

### Request Path Components <a name="release-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="release-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="release-body"></a>

The body of the request should be serialized JSON that validates against
the [Edge Deployment Release](schemas.md#edge-deployment-release) schema. For example, the following would be a
valid body for this request:

```json
{
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "version": "v1.2.3",
  "deviceIds": [
    "575ecf887ae143cd83dc4aa2"
  ]
}
```

### Curl Example <a name="release-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"flowId":"575ed18f7ae143cd83dc4aa6","version":"v1.2.3","deviceIds":["575ecf887ae143cd83dc4aa2"]}' \
    https://api.losant.com/applications/APPLICATION_ID/edge/deployments/release
```

### Successful Responses <a name="release-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Success](schemas.md#success) | If deployment release has been initiated successfully |

### Error Responses <a name="release-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Remove

Remove all edge deployments from a device, remove all edge deployments of a workflow, or remove a specific workflow from a specific device

### Method And Url <a name="remove-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/edge/deployments/remove

### Authentication <a name="remove-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, edgeDeployments.*, or edgeDeployments.remove.

### Request Path Components <a name="remove-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="remove-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="remove-body"></a>

The body of the request should be serialized JSON that validates against
the [Edge Deployment Remove](schemas.md#edge-deployment-remove) schema. For example, the following would be a
valid body for this request:

```json
{
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "deviceId": null
}
```

### Curl Example <a name="remove-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"flowId":"575ed18f7ae143cd83dc4aa6","deviceId":null}' \
    https://api.losant.com/applications/APPLICATION_ID/edge/deployments/remove
```

### Successful Responses <a name="remove-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Success](schemas.md#success) | If deployment removal has been initiated successfully |

### Error Responses <a name="remove-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Replace

Replace deployments of an edge workflow version with a new version. New version can be blank, if removal is desired.

### Method And Url <a name="replace-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/edge/deployments/replace

### Authentication <a name="replace-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, edgeDeployments.*, or edgeDeployments.replace.

### Request Path Components <a name="replace-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="replace-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="replace-body"></a>

The body of the request should be serialized JSON that validates against
the [Edge Deployment Replace](schemas.md#edge-deployment-replace) schema. For example, the following would be a
valid body for this request:

```json
{
  "flowId": "575ed18f7ae143cd83dc4aa6",
  "oldVersion": "v1.2.3",
  "newVersion": "v1.2.4"
}
```

### Curl Example <a name="replace-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"flowId":"575ed18f7ae143cd83dc4aa6","oldVersion":"v1.2.3","newVersion":"v1.2.4"}' \
    https://api.losant.com/applications/APPLICATION_ID/edge/deployments/replace
```

### Successful Responses <a name="replace-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Success](schemas.md#success) | If deployment replacement has been initiated successfully |

### Error Responses <a name="replace-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
