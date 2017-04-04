# Auth Actions

https://api.losant.com/auth

Below are the various requests that can be performed against the
Auth resource, as well as the expected
parameters and the potential responses.

## Authenticate Device

Authenticates a device using the provided credentials.

#### Method And Url

POST https://api.losant.com/auth/device

#### Authentication
No authentication is required for this endpoint.

#### Request Body

The body of the request should be serialized JSON that validates against
the [Device Credentials](schemas.md#device-credentials) schema. For example, the following would be a
valid body for this request:

```json
{
  "deviceId": "575ecf887ae143cd83dc4aa2",
  "key": "this_would_be_the_key",
  "secret": "this_would_be_the_secret"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"deviceId":"575ecf887ae143cd83dc4aa2","key":"this_would_be_the_key","secret":"this_would_be_the_secret"}' \
    https://api.losant.com/auth/device
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated Device](schemas.md#authenticated-device) | Successful authentication. The included api access token has the scope &#x27;all.Device&#x27;. |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

<br/>

## Authenticate Solution User

Authenticates a solution user using the provided credentials.

#### Method And Url

POST https://api.losant.com/auth/solutionUser

#### Authentication
No authentication is required for this endpoint.

#### Request Body

The body of the request should be serialized JSON that validates against
the [Solution User Credentials](schemas.md#solution-user-credentials) schema. For example, the following would be a
valid body for this request:

```json
{
  "solutionId": "57955788124b37010084c053",
  "email": "example@solutionuser.com",
  "password": "this is the password"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"solutionId":"57955788124b37010084c053","email":"example@solutionuser.com","password":"this is the password"}' \
    https://api.losant.com/auth/solutionUser
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated Solution User](schemas.md#authenticated-solution-user) | Successful authentication |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

<br/>

## Authenticate User

Authenticates a user using the provided credentials.

#### Method And Url

POST https://api.losant.com/auth/user

#### Authentication
No authentication is required for this endpoint.

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
    -X POST \
    -d '{"email":"example@losant.com","password":"this is the password"}' \
    https://api.losant.com/auth/user
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated User](schemas.md#authenticated-user) | Successful authentication. The included api access token has the scope &#x27;all.User&#x27;. |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

<br/>

## Authenticate User Github

Authenticates a user via GitHub OAuth.

#### Method And Url

POST https://api.losant.com/auth/user/github

#### Authentication
No authentication is required for this endpoint.

#### Request Body

The body of the request should be serialized JSON that validates against
the [Github Login](schemas.md#github-login) schema. For example, the following would be a
valid body for this request:

```json
{
  "accessToken": "the github access token"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"accessToken":"the github access token"}' \
    https://api.losant.com/auth/user/github
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated User](schemas.md#authenticated-user) | Successful authentication. The included api access token has the scope &#x27;all.User&#x27;. |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

<br/>

