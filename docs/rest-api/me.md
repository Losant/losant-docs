---
description: A detailed look at the various REST actions supported by the Me resource of the Losant API. Learn more.
---

# Me Actions

https://api.losant.com/me

Below are the various requests that can be performed against the
Me resource, as well as the expected
parameters and the potential responses.

## Add Recent Item

Adds an item to a recent item list

### Method And Url <a name="addRecentItem-method-url"></a>

POST https://api.losant.com/me/recentItems

### Authentication <a name="addRecentItem-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.addRecentItem.

### Request Headers <a name="addRecentItem-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="addRecentItem-body"></a>

The body of the request should be serialized JSON that validates against
the [Recent Item](schemas.md#recent-item) schema. For example, the following would be a
valid body for this request:

```json
{
  "itemType": "device",
  "parentId": "575ec8687ae143cd83dc4a97",
  "itemId": "575ecf887ae143cd83dc4aa2"
}
```

### Curl Example <a name="addRecentItem-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"itemType":"device","parentId":"575ec8687ae143cd83dc4a97","itemId":"575ecf887ae143cd83dc4aa2"}' \
    https://api.losant.com/me/recentItems
```

### Successful Responses <a name="addRecentItem-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Recent Item List](schemas.md#recent-item-list) | Updated recent item list |

### Error Responses <a name="addRecentItem-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Change Password

Changes the current user&#x27;s password and optionally logs out all other sessions

### Method And Url <a name="changePassword-method-url"></a>

PATCH https://api.losant.com/me/changePassword

### Authentication <a name="changePassword-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.changePassword.

### Request Headers <a name="changePassword-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="changePassword-body"></a>

The body of the request should be serialized JSON that validates against
the [Change Password](schemas.md#change-password) schema. For example, the following would be a
valid body for this request:

```json
{
  "newPassword": "yourNewPassword",
  "password": "yourCurrentPassword",
  "invalidateExistingTokens": true
}
```

### Curl Example <a name="changePassword-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"newPassword":"yourNewPassword","password":"yourCurrentPassword","invalidateExistingTokens":true}' \
    https://api.losant.com/me/changePassword
```

### Successful Responses <a name="changePassword-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated User](schemas.md#authenticated-user) | A new, valid, auth token (potentially all previous tokens are now invalid) |

### Error Responses <a name="changePassword-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Delete

Deletes the current user

### Method And Url <a name="delete-method-url"></a>

POST https://api.losant.com/me/delete

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.delete.

### Request Headers <a name="delete-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="delete-body"></a>

The body of the request should be serialized JSON that validates against
the [User Credentials](schemas.md#user-credentials) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "example@losant.com",
  "password": "this is the password"
}
```

### Curl Example <a name="delete-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"email":"example@losant.com","password":"this is the password"}' \
    https://api.losant.com/me/delete
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If the user was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Disable Two Factor Auth

Disables two factor auth for the current user

### Method And Url <a name="disableTwoFactorAuth-method-url"></a>

PATCH https://api.losant.com/me/disableTwoFactorAuth

### Authentication <a name="disableTwoFactorAuth-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.disableTwoFactorAuth.

### Request Headers <a name="disableTwoFactorAuth-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="disableTwoFactorAuth-body"></a>

The body of the request should be serialized JSON that validates against
the [Disable Two Factor Auth](schemas.md#disable-two-factor-auth) schema. For example, the following would be a
valid body for this request:

```json
{
  "twoFactorCode": "123123",
  "password": "this would be your password"
}
```

### Curl Example <a name="disableTwoFactorAuth-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"twoFactorCode":"123123","password":"this would be your password"}' \
    https://api.losant.com/me/disableTwoFactorAuth
```

### Successful Responses <a name="disableTwoFactorAuth-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

### Error Responses <a name="disableTwoFactorAuth-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Disconnect Github

Disconnects the user from Github

### Method And Url <a name="disconnectGithub-method-url"></a>

PATCH https://api.losant.com/me/disconnectGithub

### Authentication <a name="disconnectGithub-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.disconnectGithub.

### Request Headers <a name="disconnectGithub-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="disconnectGithub-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    https://api.losant.com/me/disconnectGithub
```

### Successful Responses <a name="disconnectGithub-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

### Error Responses <a name="disconnectGithub-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Disconnect Twitter

Disconnects the user from Twitter

### Method And Url <a name="disconnectTwitter-method-url"></a>

PATCH https://api.losant.com/me/disconnectTwitter

### Authentication <a name="disconnectTwitter-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.disconnectTwitter.

### Request Headers <a name="disconnectTwitter-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="disconnectTwitter-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    https://api.losant.com/me/disconnectTwitter
```

### Successful Responses <a name="disconnectTwitter-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

### Error Responses <a name="disconnectTwitter-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Enable Two Factor Auth

Enables two factor auth for the current user

### Method And Url <a name="enableTwoFactorAuth-method-url"></a>

PATCH https://api.losant.com/me/enableTwoFactorAuth

### Authentication <a name="enableTwoFactorAuth-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.enableTwoFactorAuth.

### Request Headers <a name="enableTwoFactorAuth-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="enableTwoFactorAuth-body"></a>

The body of the request should be serialized JSON that validates against
the [Enable Two Factor Auth](schemas.md#enable-two-factor-auth) schema. For example, the following would be a
valid body for this request:

```json
{
  "twoFactorAuthKey": "HBBGWJJVOVLXS4ZGNRTDOUKTMESFUR3BMRWVQND2HJYT44TOMVJA",
  "password": "this would be your password"
}
```

### Curl Example <a name="enableTwoFactorAuth-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"twoFactorAuthKey":"HBBGWJJVOVLXS4ZGNRTDOUKTMESFUR3BMRWVQND2HJYT44TOMVJA","password":"this would be your password"}' \
    https://api.losant.com/me/enableTwoFactorAuth
```

### Successful Responses <a name="enableTwoFactorAuth-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

### Error Responses <a name="enableTwoFactorAuth-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Fetch Recent Items

Gets a recent item list

### Method And Url <a name="fetchRecentItems-method-url"></a>

GET https://api.losant.com/me/recentItems

### Authentication <a name="fetchRecentItems-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.SolutionUser.read, all.User, all.User.read, me.*, or me.fetchRecentItems.

### Request Query Parameters <a name="fetchRecentItems-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| parentId | N | Parent id of the recent list |  | parentId&#x3D;575ec8687ae143cd83dc4a97 |
| itemType | Y | Item type to get the recent list of. Accepted values are: application, device, flow, dashboard, organization |  | itemType&#x3D;application |

### Request Headers <a name="fetchRecentItems-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="fetchRecentItems-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/me/recentItems?itemType=application
```

### Successful Responses <a name="fetchRecentItems-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Recent Item List](schemas.md#recent-item-list) | Recent item list |

### Error Responses <a name="fetchRecentItems-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Get

Retrieves information on the current user

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/me

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.SolutionUser.read, all.User, all.User.read, me.*, or me.get.

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| includeRecent | N | Should the user include recent app/dashboard info |  | includeRecent&#x3D;true |
| summaryExclude | N | Comma seperated list of summary fields to exclude from user summary |  | summaryExclude&#x3D;payloadCount |
| summaryInclude | N | Comma seperated list of summary fields to include in user summary |  | summaryInclude&#x3D;payloadCount |

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
    https://api.losant.com/me
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Current user information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |

## Patch

Updates information about the current user

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/me

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.patch.

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Me Patch](schemas.md#me-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "example@losant.com",
  "firstName": "Example",
  "lastName": "Name",
  "companyName": "Losant IoT, Inc.",
  "url": "https://www.losant.com",
  "password": "my new password"
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"email":"example@losant.com","firstName":"Example","lastName":"Name","companyName":"Losant IoT, Inc.","url":"https://www.losant.com","password":"my new password"}' \
    https://api.losant.com/me
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Payload Counts

Returns payload counts for the time range specified for all applications the current user owns

### Method And Url <a name="payloadCounts-method-url"></a>

GET https://api.losant.com/me/payloadCounts

### Authentication <a name="payloadCounts-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, all.User.read, me.*, or me.payloadCounts.

### Request Query Parameters <a name="payloadCounts-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start of range for payload count query (ms since epoch) |  | start&#x3D;0 |
| end | N | End of range for payload count query (ms since epoch) |  | end&#x3D;1465790400000 |

### Request Headers <a name="payloadCounts-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="payloadCounts-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/me/payloadCounts
```

### Successful Responses <a name="payloadCounts-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Counts](schemas.md#payload-counts) | Payload counts, by type and source |

### Error Responses <a name="payloadCounts-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Transfer Resources

Moves resources to a new owner

### Method And Url <a name="transferResources-method-url"></a>

PATCH https://api.losant.com/me/transferResources

### Authentication <a name="transferResources-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.transferResources.

### Request Headers <a name="transferResources-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="transferResources-body"></a>

The body of the request should be serialized JSON that validates against
the [Resource Transfer](schemas.md#resource-transfer) schema. For example, the following would be a
valid body for this request:

```json
{
  "destinationId": "575ed6e87ae143cd83dc4aa8",
  "destinationType": "organization",
  "applicationIds": [
    "575ec8687ae143cd83dc4a97"
  ]
}
```

### Curl Example <a name="transferResources-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"destinationId":"575ed6e87ae143cd83dc4aa8","destinationType":"organization","applicationIds":["575ec8687ae143cd83dc4a97"]}' \
    https://api.losant.com/me/transferResources
```

### Successful Responses <a name="transferResources-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If resource transfer was successful |

### Error Responses <a name="transferResources-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

## Verify Email

Sends an email verification to the user

### Method And Url <a name="verifyEmail-method-url"></a>

POST https://api.losant.com/me/verify-email

### Authentication <a name="verifyEmail-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.verifyEmail.

### Request Headers <a name="verifyEmail-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="verifyEmail-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/me/verify-email
```

### Successful Responses <a name="verifyEmail-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If email verification was successfully sent |

### Error Responses <a name="verifyEmail-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
