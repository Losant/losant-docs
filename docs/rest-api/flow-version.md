description: A detailed look at the various REST actions supported by the Flow Version resource of the Losant API. Learn more.

# Flow Version Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/versions/**`FLOW_VERSION_ID`**

Below are the various requests that can be performed against the
Flow Version resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a flow version

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/versions/**`FLOW_VERSION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flowVersion.*, or flowVersion.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |
| FLOW_VERSION_ID | ID associated with the flow version | 675ed18f7ae143cd83dc4bb7 |

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
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/versions/FLOW_VERSION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If flow version was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow version was not found |

<br/>

## Get

Retrieves information on a flow version

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/versions/**`FLOW_VERSION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersion.*, or flowVersion.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |
| FLOW_VERSION_ID | ID associated with the flow version | 675ed18f7ae143cd83dc4bb7 |

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
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/versions/FLOW_VERSION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Version](schemas.md#workflow-version) | Flow version information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow version was not found |

<br/>

## Get Log Entries

Retrieve the recent log entries about runs of this workflow version

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/versions/**`FLOW_VERSION_ID`**/logs

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, flowVersion.*, or flowVersion.log.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |
| FLOW_VERSION_ID | ID associated with the flow version | 675ed18f7ae143cd83dc4bb7 |

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
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/versions/FLOW_VERSION_ID/logs
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

## Patch

Updates information about a flow version

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/flows/**`FLOW_ID`**/versions/**`FLOW_VERSION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, flowVersion.*, or flowVersion.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| FLOW_ID | ID associated with the flow | 575ed18f7ae143cd83dc4aa6 |
| FLOW_VERSION_ID | ID associated with the flow version | 675ed18f7ae143cd83dc4bb7 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Workflow Version Patch](schemas.md#workflow-version-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "notes": "Updated workflow version notes",
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
    -d '{"notes":"Updated workflow version notes","enabled":false}' \
    https://api.losant.com/applications/APPLICATION_ID/flows/FLOW_ID/versions/FLOW_VERSION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Workflow Version](schemas.md#workflow-version) | Updated flow version information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if flow version was not found |

<br/>

