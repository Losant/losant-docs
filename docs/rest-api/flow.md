# Flow Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

Below are the various requests that can be performed against the
Flow resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

Deletes a flow

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

Retrieves information on a flow

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## GET - /logs

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/logs

Retrieve the recent log entries about the flows

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max log entries to return (ordered by time descending) | 1 | 10 |
| since | N | Look for log entries since this time (ms since epoch) | 0 | 1465790400000 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## GET - /storage

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

Gets the current values in persistent storage

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## PATCH

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**

Updates information about a flow

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## POST - /virtualButton

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/virtualButton

Presses the specified virtual button on the flow

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## PATCH - /storage

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/storage

Sets a storage value

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

