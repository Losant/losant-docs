description: A detailed look at the various REST actions supported by the Me resource of the Losant API. Learn more.

# Me Actions

https://api.losant.com/me

Below are the various requests that can be performed against the
Me resource, as well as the expected
parameters and the potential responses.

## Add Recent Item

Adds an item to a recent item list

#### Method And Url

POST https://api.losant.com/me/recentItems

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.addRecentItem.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

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
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"itemType":"device","parentId":"575ec8687ae143cd83dc4a97","itemId":"575ecf887ae143cd83dc4aa2"}' \
    https://api.losant.com/me/recentItems
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Recent Item List](schemas.md#recent-item-list) | Updated recent item list |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Delete

Deletes the current user

#### Method And Url

POST https://api.losant.com/me/delete

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.delete.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [User Credentials](schemas.md#user-credentials) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "example@losant.com",
  "password": "this is the password"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"email":"example@losant.com","password":"this is the password"}' \
    https://api.losant.com/me/delete
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If the user was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Disable Two Factor Auth

Disables two factor auth for the current user

#### Method And Url

PATCH https://api.losant.com/me/disableTwoFactorAuth

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.disableTwoFactorAuth.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Disable Two Factor Auth](schemas.md#disable-two-factor-auth) schema. For example, the following would be a
valid body for this request:

```json
{
  "twoFactorCode": "123123",
  "password": "this would be your password"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"twoFactorCode":"123123","password":"this would be your password"}' \
    https://api.losant.com/me/disableTwoFactorAuth
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Disconnect Github

Disconnects the user from Github

#### Method And Url

PATCH https://api.losant.com/me/disconnectGithub

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.disconnectGithub.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    https://api.losant.com/me/disconnectGithub
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Disconnect Twitter

Disconnects the user from Twitter

#### Method And Url

PATCH https://api.losant.com/me/disconnectTwitter

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.disconnectTwitter.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    https://api.losant.com/me/disconnectTwitter
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Enable Two Factor Auth

Enables two factor auth for the current user

#### Method And Url

PATCH https://api.losant.com/me/enableTwoFactorAuth

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.enableTwoFactorAuth.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Enable Two Factor Auth](schemas.md#enable-two-factor-auth) schema. For example, the following would be a
valid body for this request:

```json
{
  "twoFactorAuthKey": "HBBGWJJVOVLXS4ZGNRTDOUKTMESFUR3BMRWVQND2HJYT44TOMVJA",
  "password": "this would be your password"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"twoFactorAuthKey":"HBBGWJJVOVLXS4ZGNRTDOUKTMESFUR3BMRWVQND2HJYT44TOMVJA","password":"this would be your password"}' \
    https://api.losant.com/me/enableTwoFactorAuth
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Fetch Recent Items

Gets a recent item list

#### Method And Url

GET https://api.losant.com/me/recentItems

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.SolutionUser.read, all.User, all.User.read, me.*, or me.fetchRecentItems.

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| parentId | N | Parent id of the recent list |  | 575ec8687ae143cd83dc4a97 |
| itemType | Y | Item type to get the recent list of. Accepted values are: application, device, flow, dashboard, organization |  | application |

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
    https://api.losant.com/me/recentItems?itemType=application
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Recent Item List](schemas.md#recent-item-list) | Recent item list |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Get

Retrieves information on the current user

#### Method And Url

GET https://api.losant.com/me

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.SolutionUser.read, all.User, all.User.read, me.*, or me.get.

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| includeRecent | N | Should the user include recent app/dashboard info |  | true |
| summaryExclude | N | List of summary fields to exclude from user summary |  | payloadCount |

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
    https://api.losant.com/me
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Current user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |

<br/>

## Patch

Updates information about the current user

#### Method And Url

PATCH https://api.losant.com/me

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.patch.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

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
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"email":"example@losant.com","firstName":"Example","lastName":"Name","companyName":"Losant IoT, Inc.","url":"https://www.losant.com","password":"my new password"}' \
    https://api.losant.com/me
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Me](schemas.md#me) | Updated user information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Payload Counts

Returns payload counts for the time range specified for all applications the current user owns

#### Method And Url

GET https://api.losant.com/me/payloadCounts

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, all.User.read, me.*, or me.payloadCounts.

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start of range for payload count query (ms since epoch) |  | 0 |
| end | N | End of range for payload count query (ms since epoch) |  | 1465790400000 |

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
    https://api.losant.com/me/payloadCounts
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Counts](schemas.md#payload-counts) | Payload counts, by type and source |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Transfer Resources

Moves resources to a new owner

#### Method And Url

PATCH https://api.losant.com/me/transferResources

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.transferResources.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

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
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"destinationId":"575ed6e87ae143cd83dc4aa8","destinationType":"organization","applicationIds":["575ec8687ae143cd83dc4a97"]}' \
    https://api.losant.com/me/transferResources
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If resource transfer was successful |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Verify Email

Sends an email verification to the user

#### Method And Url

POST https://api.losant.com/me/verify-email

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.SolutionUser, all.User, me.*, or me.verifyEmail.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/me/verify-email
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If email verification was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

