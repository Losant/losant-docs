---
description: A detailed look at the various REST actions supported by the Auth resource of the Losant API. Learn more.
---

# Auth Actions

https://api.losant.com/auth

Below are the various requests that can be performed against the
Auth resource, as well as the expected
parameters and the potential responses.

## Authenticate Device

Authenticates a device using the provided credentials.

### Method And Url <a name="authenticateDevice-method-url"></a>

POST https://api.losant.com/auth/device

### Authentication <a name="authenticateDevice-authentication"></a>

No authentication is required for this endpoint.

### Request Body <a name="authenticateDevice-body"></a>

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

### Curl Example <a name="authenticateDevice-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"deviceId":"575ecf887ae143cd83dc4aa2","key":"this_would_be_the_key","secret":"this_would_be_the_secret"}' \
    https://api.losant.com/auth/device
```

### Successful Responses <a name="authenticateDevice-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated Device](schemas.md#authenticated-device) | Successful authentication. The included api access token has the scope &#x27;all.Device&#x27;. |

### Error Responses <a name="authenticateDevice-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

## Authenticate Solution User

Authenticates a solution user using the provided credentials.

### Method And Url <a name="authenticateSolutionUser-method-url"></a>

POST https://api.losant.com/auth/solutionUser

### Authentication <a name="authenticateSolutionUser-authentication"></a>

No authentication is required for this endpoint.

### Request Body <a name="authenticateSolutionUser-body"></a>

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

### Curl Example <a name="authenticateSolutionUser-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"solutionId":"57955788124b37010084c053","email":"example@solutionuser.com","password":"this is the password"}' \
    https://api.losant.com/auth/solutionUser
```

### Successful Responses <a name="authenticateSolutionUser-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated Solution User](schemas.md#authenticated-solution-user) | Successful authentication |

### Error Responses <a name="authenticateSolutionUser-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

## Authenticate User

Authenticates a user using the provided credentials.

### Method And Url <a name="authenticateUser-method-url"></a>

POST https://api.losant.com/auth/user

### Authentication <a name="authenticateUser-authentication"></a>

No authentication is required for this endpoint.

### Request Body <a name="authenticateUser-body"></a>

The body of the request should be serialized JSON that validates against
the [User Credentials](schemas.md#user-credentials) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "example@losant.com",
  "password": "this is the password"
}
```

### Curl Example <a name="authenticateUser-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"email":"example@losant.com","password":"this is the password"}' \
    https://api.losant.com/auth/user
```

### Successful Responses <a name="authenticateUser-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated User](schemas.md#authenticated-user) | Successful authentication. The included api access token has the scope &#x27;all.User&#x27;. |

### Error Responses <a name="authenticateUser-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |

## Authenticate User Github

Authenticates a user via GitHub OAuth.

### Method And Url <a name="authenticateUserGithub-method-url"></a>

POST https://api.losant.com/auth/user/github

### Authentication <a name="authenticateUserGithub-authentication"></a>

No authentication is required for this endpoint.

### Request Body <a name="authenticateUserGithub-body"></a>

The body of the request should be serialized JSON that validates against
the [Github Login](schemas.md#github-login) schema. For example, the following would be a
valid body for this request:

```json
{
  "accessToken": "the github access token"
}
```

### Curl Example <a name="authenticateUserGithub-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"accessToken":"the github access token"}' \
    https://api.losant.com/auth/user/github
```

### Successful Responses <a name="authenticateUserGithub-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Authenticated User](schemas.md#authenticated-user) | Successful authentication. The included api access token has the scope &#x27;all.User&#x27;. |

### Error Responses <a name="authenticateUserGithub-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 401 | [Error](schemas.md#error) | Unauthorized error if authentication fails |
