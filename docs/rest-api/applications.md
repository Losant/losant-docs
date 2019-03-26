---
description: A detailed look at the various REST actions supported by the Applications resource of the Losant API. Learn more.
---

# Applications Actions

https://api.losant.com/applications

Below are the various requests that can be performed against the
Applications resource, as well as the expected
parameters and the potential responses.

## Get

Returns the applications the current user has permission to see

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, applications.*, or applications.get.

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, ownerId, lastUpdated | name | sortField&#x3D;name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | filterField&#x3D;name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my * app |
| orgId | N | If not provided, return all applications. If provided but blank, only return applications belonging to the current user. If provided and an id, only return applications belonging to the given organization id. |  | orgId&#x3D;575ecdf07ae143cd83dc4a9a |
| summaryExclude | N | Comma seperated list of summary fields to exclude from application summary |  | summaryExclude&#x3D;payloadCount |
| summaryInclude | N | Comma seperated list of summary fields to include in application summary |  | summaryInclude&#x3D;payloadCount |

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
    https://api.losant.com/applications
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Applications](schemas.md#applications) | Collection of applications |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Post

Create a new application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, applications.*, or applications.post.

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Application Post](schemas.md#application-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Application",
  "description": "Description of my new application"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My New Application","description":"Description of my new application"}' \
    https://api.losant.com/applications
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Application](schemas.md#application) | Successfully created application |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
