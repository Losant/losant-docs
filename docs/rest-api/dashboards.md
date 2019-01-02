---
description: A detailed look at the various REST actions supported by the Dashboards resource of the Losant API. Learn more.
---

# Dashboards Actions

https://api.losant.com/dashboards

Below are the various requests that can be performed against the
Dashboards resource, as well as the expected
parameters and the potential responses.

## Get

Returns the dashboards the current user has permission to see

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/dashboards

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.SolutionUser, all.SolutionUser.read, all.User, all.User.read, dashboards.*, or dashboards.get.

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, ownerId | name | sortField&#x3D;name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | filterField&#x3D;name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my * dashboard |
| orgId | N | If not provided, return all dashboards. If provided but blank, only return dashboards belonging to the current user. If provided and an id, only return dashboards belonging to the given organization id. |  | orgId&#x3D;575ece7e7ae143cd83dc4a9c |

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
    https://api.losant.com/dashboards
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboards](schemas.md#dashboards) | Collection of dashboards |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Post

Create a new dashboard

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/dashboards

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, dashboards.*, or dashboards.post.

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Dashboard Post](schemas.md#dashboard-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Dashboard",
  "public": false
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My New Dashboard","public":false}' \
    https://api.losant.com/dashboards
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Dashboard](schemas.md#dashboard) | Successfully created dashboard |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
