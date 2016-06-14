# Access Token Actions

https://api.losant.com/access-tokens/**`ACCESS_TOKEN_ID`**

Below are the various requests that can be performed against the
Access Token resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/access-tokens/**`ACCESS_TOKEN_ID`**

Deletes an accessToken

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ACCESS_TOKEN_ID | ID associated with the accessToken | 575ec7417ae143cd83dc4a95 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X DELETE \
    https://api.losant.com/access-tokens/ACCESS_TOKEN_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If accessToken was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if accessToken was not found |

<br/>

## GET

https://api.losant.com/access-tokens/**`ACCESS_TOKEN_ID`**

Retrieves information on an accessToken

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ACCESS_TOKEN_ID | ID associated with the accessToken | 575ec7417ae143cd83dc4a95 |

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
    https://api.losant.com/access-tokens/ACCESS_TOKEN_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Access Token](schemas.md#access-token) | Access token information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if accessToken was not found |

<br/>

## PATCH

https://api.losant.com/access-tokens/**`ACCESS_TOKEN_ID`**

Updates information about an accessToken

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ACCESS_TOKEN_ID | ID associated with the accessToken | 575ec7417ae143cd83dc4a95 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Access Token Patch](schemas.md#access-token-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Access Token",
  "status": "inactive"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Access Token","status":"inactive"}' \
    https://api.losant.com/access-tokens/ACCESS_TOKEN_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Access Token](schemas.md#access-token) | Updated accessToken information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if accessToken was not found |

<br/>

