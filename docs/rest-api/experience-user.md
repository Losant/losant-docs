---
description: A detailed look at the various REST actions supported by the Experience User resource of the Losant API. Learn more.
---

# Experience User Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users/**`EXPERIENCE_USER_ID`**

Below are the various requests that can be performed against the
Experience User resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an experience user

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users/**`EXPERIENCE_USER_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceUser.*, or experienceUser.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_USER_ID | ID associated with the experience user | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/users/EXPERIENCE_USER_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If experience user was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience user was not found |

## Get

Retrieves information on an experience user

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users/**`EXPERIENCE_USER_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceUser.*, or experienceUser.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_USER_ID | ID associated with the experience user | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/users/EXPERIENCE_USER_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience User](schemas.md#experience-user) | Experience user information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience user was not found |

## Patch

Updates information about an experience user

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/experience/users/**`EXPERIENCE_USER_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceUser.*, or experienceUser.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_USER_ID | ID associated with the experience user | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Experience User Patch](schemas.md#experience-user-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "password": "aNewPassword",
  "userTags": {
    "customKey": "newCustomValue"
  }
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"password":"aNewPassword","userTags":{"customKey":"newCustomValue"}}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/users/EXPERIENCE_USER_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience User](schemas.md#experience-user) | Updated experience user information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience user was not found |
