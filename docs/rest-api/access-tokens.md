# Access Tokens Actions

https://api.losant.com/access-tokens

Below are the various requests that can be performed against the
Access Tokens resource, as well as the expected
parameters and the potential responses.

## GET

https://api.losant.com/access-tokens

Returns the accessTokens for a user

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X GET \
    https://api.losant.com/access-tokens
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Access Tokens](schemas.md#access-tokens) | Collection of accessTokens |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## POST

https://api.losant.com/access-tokens

Create a new accessToken for a user

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Access Token Post](schemas.md#access-token-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Access Token",
  "expirationDate": "2017-06-13T04:00:00.000Z",
  "scope": [
    "devices",
    "devices.state"
  ],
  "status": "active"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"name":"My New Access Token","expirationDate":"2017-06-13T04:00:00.000Z","scope":["devices","devices.state"],"status":"active"}' \
    https://api.losant.com/access-tokens
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Access Token](schemas.md#access-token) | The successfully created accessToken |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

