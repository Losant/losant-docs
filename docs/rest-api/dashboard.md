# Dashboard Actions

https://api.losant.com/dashboards/**`DASHBOARD_ID`**

Below are the various requests that can be performed against the
Dashboard resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/dashboards/**`DASHBOARD_ID`**

Deletes a dashboard

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## GET

https://api.losant.com/dashboards/**`DASHBOARD_ID`**

Retrieves information on a dashboard

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## PATCH

https://api.losant.com/dashboards/**`DASHBOARD_ID`**

Updates information about a dashboard

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
the [Dashboard Patch](schemas.md#dashboard-patch) schema.  For example, the following would be a
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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

