# Dashboard Actions

https://api.losant.com/dashboards/**`DASHBOARD_ID`**

Below are the various requests that can be performed against the
Dashboard resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a dashboard

#### Method And Url

DELETE https://api.losant.com/dashboards/**`DASHBOARD_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, dashboard.*, or dashboard.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

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
    https://api.losant.com/dashboards/DASHBOARD_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If dashboard was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if dashboard was not found |

<br/>

## Get

Retrieves information on a dashboard

#### Method And Url

GET https://api.losant.com/dashboards/**`DASHBOARD_ID`**

#### Authentication
No authentication is required for this endpoint.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| password | N | Password for password-protected dashboards |  | myPassword |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X GET \
    https://api.losant.com/dashboards/DASHBOARD_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboard](schemas.md#dashboard) | Dashboard information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if dashboard was not found |

<br/>

## Patch

Updates information about a dashboard

#### Method And Url

PATCH https://api.losant.com/dashboards/**`DASHBOARD_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, dashboard.*, or dashboard.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Dashboard Patch](schemas.md#dashboard-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Dashboard",
  "description": "Description of my updated dashboard",
  "refreshRate": 300,
  "public": true
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Dashboard","description":"Description of my updated dashboard","refreshRate":300,"public":true}' \
    https://api.losant.com/dashboards/DASHBOARD_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboard](schemas.md#dashboard) | Update dashboard information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if dashboard was not found |

<br/>

## Validate Context

Validates a context object against the dashboard&#x27;s context configuration

#### Method And Url

POST https://api.losant.com/dashboards/**`DASHBOARD_ID`**/validateContext

#### Authentication
No authentication is required for this endpoint.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Dashboard Context Instance](schemas.md#dashboard-context-instance) schema. For example, the following would be a
valid body for this request:

```json
{
  "myContextVariable": "myValue",
  "myOtherVariable": "575ecf887ae143cd83dc4aa2"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"myContextVariable":"myValue","myOtherVariable":"575ecf887ae143cd83dc4aa2"}' \
    https://api.losant.com/dashboards/DASHBOARD_ID/validateContext
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If context is valid |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if context is invalid |
| 404 | [Error](schemas.md#error) | Error if dashboard or application was not found |

<br/>

