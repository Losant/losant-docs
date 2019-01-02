---
description: A detailed look at the various REST actions supported by the Experience Users resource of the Losant API. Learn more.
---

# Experience Users Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users

Below are the various requests that can be performed against the
Experience Users resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience users for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceUsers.*, or experienceUsers.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: firstName, lastName, email, id, creationDate, lastLogin, lastUpdated | email | sortField&#x3D;email |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: firstName, lastName, email |  | filterField&#x3D;email |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my*user |
| experienceGroupId | N | Filter users to those only in the specified group |  | experienceGroupId&#x3D;575ec8687ae143cd83dc4a97 |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/users
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Users](schemas.md#experience-users) | Collection of experience users |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new experience user for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceUsers.*, or experienceUsers.post.

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
the [Experience User Post](schemas.md#experience-user-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "example@experienceuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "password": "aUserPassword",
  "userTags": {
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
    -d '{"email":"example@experienceuser.com","firstName":"Example","lastName":"Name","password":"aUserPassword","userTags":{"customKey":"customValue"}}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/users
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience User](schemas.md#experience-user) | Successfully created experience user |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
