---
description: A detailed look at the various REST actions supported by the Flow resource of the Losant API. Learn more.
---

# Flow Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

Below are the various requests that can be performed against the
Flow resource, as well as the expected
parameters and the potential responses.

## Clear Storage Entries

Clear all storage entries

### Method And Url <a name="clearStorageEntries-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

### Authentication <a name="clearStorageEntries-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.clearStorageEntries.

### Request Path Components <a name="clearStorageEntries-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Headers <a name="clearStorageEntries-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="clearStorageEntries-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/storage
```

### Successful Responses <a name="clearStorageEntries-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Storage Entries](schemas.md#workflow-storage-entries) | The current storage entries |

### Error Responses <a name="clearStorageEntries-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

## Delete

Deletes a flow

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Headers <a name="delete-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="delete-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If flow was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

## Get

Retrieves information on a flow

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flow.*, or flow.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
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
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow](schemas.md#workflow) | Flow information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

## Get Log Entries

Retrieve the recent log entries about runs of this workflow

### Method And Url <a name="getLogEntries-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/logs

### Authentication <a name="getLogEntries-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flow.*, or flow.log.

### Request Path Components <a name="getLogEntries-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Query Parameters <a name="getLogEntries-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max log entries to return (ordered by time descending) | 1 | limit&#x3D;10 |
| since | N | Look for log entries since this time (ms since epoch) |  | since&#x3D;1465790400000 |

### Request Headers <a name="getLogEntries-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getLogEntries-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/logs
```

### Successful Responses <a name="getLogEntries-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Log](schemas.md#workflow-log) | Recent log entries |

### Error Responses <a name="getLogEntries-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Get Storage Entries

Gets the current values in persistent storage

### Method And Url <a name="getStorageEntries-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

### Authentication <a name="getStorageEntries-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flow.*, or flow.getStorageEntries.

### Request Path Components <a name="getStorageEntries-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Headers <a name="getStorageEntries-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getStorageEntries-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/storage
```

### Successful Responses <a name="getStorageEntries-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Storage Entries](schemas.md#workflow-storage-entries) | The current storage entries |

### Error Responses <a name="getStorageEntries-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

## Patch

Updates information about a flow

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Query Parameters <a name="patch-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| includeCustomNodes | N | If the result of the request should also include the details of any custom nodes referenced by the returned workflows | false | includeCustomNodes&#x3D;true |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Workflow Patch](schemas.md#workflow-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Workflow",
  "description": "Description of my updated workflow",
  "enabled": false
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Workflow","description":"Description of my updated workflow","enabled":false}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow](schemas.md#workflow) | Updated flow information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow is not found |

## Press Virtual Button

Presses the specified virtual button on the flow

### Method And Url <a name="pressVirtualButton-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/virtualButton

### Authentication <a name="pressVirtualButton-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.pressVirtualButton.

### Request Path Components <a name="pressVirtualButton-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Headers <a name="pressVirtualButton-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="pressVirtualButton-body"></a>

The body of the request should be serialized JSON that validates against
the [Virtual Button Press](schemas.md#virtual-button-press) schema. For example, the following would be a
valid body for this request:

```json
{
  "key": "575ed18f7ae143cd83dc4aa6-SJaEw_dV",
  "payload": {
    "some": "data"
  }
}
```

### Curl Example <a name="pressVirtualButton-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"key":"575ed18f7ae143cd83dc4aa6-SJaEw_dV","payload":{"some":"data"}}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/virtualButton
```

### Successful Responses <a name="pressVirtualButton-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Virtual button was pressed |

### Error Responses <a name="pressVirtualButton-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

## Set Storage Entry

Sets a storage value

### Method And Url <a name="setStorageEntry-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

### Authentication <a name="setStorageEntry-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.setStorageEntry.

### Request Path Components <a name="setStorageEntry-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

### Request Headers <a name="setStorageEntry-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="setStorageEntry-body"></a>

The body of the request should be serialized JSON that validates against
the [Workflow Storage Entry](schemas.md#workflow-storage-entry) schema. For example, the following would be a
valid body for this request:

```json
{
  "key": "myStorageKey",
  "value": 12
}
```

### Curl Example <a name="setStorageEntry-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"key":"myStorageKey","value":12}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/storage
```

### Successful Responses <a name="setStorageEntry-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Value was successfully stored |

### Error Responses <a name="setStorageEntry-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |
