---
description: A detailed look at the various REST actions supported by the Dashboard resource of the Losant API. Learn more.
---

# Dashboard Actions

https://api.losant.com/dashboards/**`DASHBOARD_ID`**

Below are the various requests that can be performed against the
Dashboard resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a dashboard

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/dashboards/**`DASHBOARD_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, dashboard.*, or dashboard.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

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
    https://api.losant.com/dashboards/DASHBOARD_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If dashboard was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if dashboard was not found |

## Get

Retrieves information on a dashboard

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/dashboards/**`DASHBOARD_ID`**

### Authentication <a name="get-authentication"></a>

No authentication is required for this endpoint.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| password | N | Password for password-protected dashboards |  | password&#x3D;myPassword |

### Curl Example <a name="get-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X GET \
    https://api.losant.com/dashboards/DASHBOARD_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboard](schemas.md#dashboard) | Dashboard information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if dashboard was not found |

## Patch

Updates information about a dashboard

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/dashboards/**`DASHBOARD_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, dashboard.*, or dashboard.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

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

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Dashboard","description":"Description of my updated dashboard","refreshRate":300,"public":true}' \
    https://api.losant.com/dashboards/DASHBOARD_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboard](schemas.md#dashboard) | Update dashboard information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if dashboard was not found |

## Validate Context

Validates a context object against the dashboard&#x27;s context configuration

### Method And Url <a name="validateContext-method-url"></a>

POST https://api.losant.com/dashboards/**`DASHBOARD_ID`**/validateContext

### Authentication <a name="validateContext-authentication"></a>

No authentication is required for this endpoint.

### Request Path Components <a name="validateContext-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| DASHBOARD_ID | ID of the associated dashboard | 575ece2b7ae143cd83dc4a9b |

### Request Query Parameters <a name="validateContext-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| password | N | Password for password-protected dashboards |  | password&#x3D;myPassword |

### Request Body <a name="validateContext-body"></a>

The body of the request should be serialized JSON that validates against
the [Dashboard Context Instance](schemas.md#dashboard-context-instance) schema. For example, the following would be a
valid body for this request:

```json
{
  "myContextVariable": "myValue",
  "myOtherVariable": "575ecf887ae143cd83dc4aa2"
}
```

### Curl Example <a name="validateContext-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"myContextVariable":"myValue","myOtherVariable":"575ecf887ae143cd83dc4aa2"}' \
    https://api.losant.com/dashboards/DASHBOARD_ID/validateContext
```

### Successful Responses <a name="validateContext-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If context is valid |

### Error Responses <a name="validateContext-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if context is invalid |
| 404 | [Error](schemas.md#error) | Error if dashboard or application was not found |
