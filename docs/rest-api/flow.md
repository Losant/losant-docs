# Flow Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

Below are the various requests that can be performed against the
Flow resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a flow

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If flow was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

<br/>

## Get

Retrieves information on a flow

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flow.*, or flow.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow](schemas.md#workflow) | Flow information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

<br/>

## Get Log Entries

Retrieve the recent log entries about the flows

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/logs

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flow.*, or flow.log.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max log entries to return (ordered by time descending) | 1 | 10 |
| since | N | Look for log entries since this time (ms since epoch) |  | 1465790400000 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/logs
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Log](schemas.md#workflow-log) | Recent log entries |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## Get Storage Entries

Gets the current values in persistent storage

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flow.*, or flow.getStorageEntries.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/storage
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Storage Entries](schemas.md#workflow-storage-entries) | The stored values |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

<br/>

## Patch

Updates information about a flow

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Workflow Patch](schemas.md#workflow-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Workflow",
  "description": "Description of my updated workflow",
  "enabled": false
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Workflow","description":"Description of my updated workflow","enabled":false}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow](schemas.md#workflow) | Updated flow information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow is not found |

<br/>

## Press Virtual Button

Presses the specified virtual button on the flow

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/virtualButton

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.pressVirtualButton.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Virtual Button Press](schemas.md#virtual-button-press) schema.  For example, the following would be a
valid body for this request:

```json
{
  "key": "575ed18f7ae143cd83dc4aa6-SJaEw_dV",
  "payload": {
    "some": "data"
  }
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"key":"575ed18f7ae143cd83dc4aa6-SJaEw_dV","payload":{"some":"data"}}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/virtualButton
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Virtual button was pressed |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

<br/>

## Set Storage Entry

Sets a storage value

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flow.*, or flow.setStorageEntry.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Workflow Storage Entry](schemas.md#workflow-storage-entry) schema.  For example, the following would be a
valid body for this request:

```json
{
  "key": "myStorageKey",
  "value": 12
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"key":"myStorageKey","value":12}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/storage
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Value was successfully stored |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow was not found |

<br/>

