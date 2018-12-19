---
description: A detailed look at the various REST actions supported by the Experience Views resource of the Losant API. Learn more.
---

# Experience Views Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/views

Below are the various requests that can be performed against the
Experience Views resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience views for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/views

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceViews.*, or experienceViews.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: id, creationDate, name, lastUpdated | name | sortField&#x3D;name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | filterField&#x3D;name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my*view |
| viewType | N | Filter views to those only of the given type. Accepted values are: page, layout, component |  | viewType&#x3D;page |
| version | N | Return the experience views belonging to this version | develop | version&#x3D;develop |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/views
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Views](schemas.md#experience-views) | Collection of experience views |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new experience view for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/views

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceViews.*, or experienceViews.post.

### Request Path Components <a name="post-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Experience View Post](schemas.md#experience-view-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Page View",
  "viewType": "page",
  "body": "<p>{{data}}</p>",
  "layoutId": "59cc5cad8246c6caed4b16c2",
  "viewTags": {
    "customKey": "customValue"
  }
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My Page View","viewType":"page","body":"<p>{{data}}</p>","layoutId":"59cc5cad8246c6caed4b16c2","viewTags":{"customKey":"customValue"}}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/views
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience View](schemas.md#experience-view) | Successfully created experience view |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
