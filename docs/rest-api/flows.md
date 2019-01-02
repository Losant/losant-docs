---
description: A detailed look at the various REST actions supported by the Flows resource of the Losant API. Learn more.
---

# Flows Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/flows

Below are the various requests that can be performed against the
Flows resource, as well as the expected
parameters and the potential responses.

## Get

Returns the flows for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flows.*, or flows.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, lastUpdated | name | sortField&#x3D;name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | filterField&#x3D;name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my*flow |
| flowClass | N | Filter the workflows by the given flow class. Accepted values are: edge, cloud, customNode, experience | cloud | flowClass&#x3D;cloud |
| triggerFilter | N | Array of triggers to filter by - always filters against default flow version. See [Workflow Trigger Filter](schemas.md#workflow-trigger-filter) for more details. |  | triggerFilter[0][type]&#x3D;webhook&amp;triggerFilter[0][key]&#x3D;575ed78e7ae143cd83dc4aab |
| includeCustomNodes | N | If the result of the request should also include the details of any custom nodes referenced by the returned workflows | false | includeCustomNodes&#x3D;true |

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
    https://api.losant.com/applications/APPLICATION_ID/flows
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflows](schemas.md#workflows) | Collection of flows |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Get by Version

Returns the flows by version for an application

### Method And Url <a name="getByVersion-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/version

### Authentication <a name="getByVersion-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flows.*, or flows.getByVersion.

### Request Path Components <a name="getByVersion-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="getByVersion-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, lastUpdated | name | sortField&#x3D;name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | filterField&#x3D;name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my*flow |
| flowClass | N | Filter the workflows by the given flow class. Accepted values are: edge, cloud, customNode, experience | cloud | flowClass&#x3D;cloud |
| version | Y | Return the workflow versions for the given version. |  | version&#x3D;myVersion |
| triggerFilter | N | Array of triggers to filter by - always filters against default flow version. See [Workflow Trigger Filter](schemas.md#workflow-trigger-filter) for more details. |  | triggerFilter[0][type]&#x3D;webhook&amp;triggerFilter[0][key]&#x3D;575ed78e7ae143cd83dc4aab |
| includeCustomNodes | N | If the result of the request should also include the details of any custom nodes referenced by the returned workflows | false | includeCustomNodes&#x3D;true |

### Request Headers <a name="getByVersion-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getByVersion-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/flows/version?version=myVersion
```

### Successful Responses <a name="getByVersion-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Versions](schemas.md#workflow-versions) | Collection of flow versions |

### Error Responses <a name="getByVersion-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Import

Import a set of flows and flow versions

### Method And Url <a name="import-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/flows/import

### Authentication <a name="import-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flows.*, or flows.import.

### Request Path Components <a name="import-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="import-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="import-body"></a>

The body of the request should be serialized JSON that validates against
the [Workflow Import](schemas.md#workflow-import) schema. For example, the following would be a
valid body for this request:

```json
{
  "flows": [
    {
      "id": "575ed18f7ae143cd83dc4aa6",
      "flowId": "575ed18f7ae143cd83dc4aa6",
      "applicationId": "575ec8687ae143cd83dc4a97",
      "creationDate": "2016-06-13T04:00:00.000Z",
      "lastUpdated": "2016-06-13T04:00:00.000Z",
      "name": "My Workflow",
      "description": "Description of my empty workflow",
      "enabled": true,
      "triggers": [],
      "nodes": [],
      "globals": [],
      "stats": {
        "runCount": 0,
        "errorCount": 0
      }
    }
  ],
  "flowVersions": []
}
```

### Curl Example <a name="import-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"flows":[{"id":"575ed18f7ae143cd83dc4aa6","flowId":"575ed18f7ae143cd83dc4aa6","applicationId":"575ec8687ae143cd83dc4a97","creationDate":"2016-06-13T04:00:00.000Z","lastUpdated":"2016-06-13T04:00:00.000Z","name":"My Workflow","description":"Description of my empty workflow","enabled":true,"triggers":[],"nodes":[],"globals":[],"stats":{"runCount":0,"errorCount":0}}],"flowVersions":[]}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/import
```

### Successful Responses <a name="import-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Workflow Import Result](schemas.md#workflow-import-result) | Successfully imported workflows |

### Error Responses <a name="import-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new flow for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/flows

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flows.*, or flows.post.

### Request Path Components <a name="post-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="post-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| includeCustomNodes | N | If the result of the request should also include the details of any custom nodes referenced by the returned workflows | false | includeCustomNodes&#x3D;true |

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Workflow Post](schemas.md#workflow-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Workflow",
  "description": "Description of my new workflow"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My New Workflow","description":"Description of my new workflow"}' \
    https://api.losant.com/applications/APPLICATION_ID/flows
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Workflow](schemas.md#workflow) | Successfully created flow |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
