# Application Key Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/keys/**`APPLICATION_KEY_ID`**

Below are the various requests that can be performed against the
Application Key resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/applications/**`APPLICATION_ID`**/keys/**`APPLICATION_KEY_ID`**

Deletes an applicationKey

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| APPLICATION_KEY_ID | ID associated with the applicationKey | 575ec76c7ae143cd83dc4a96 |

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
    https://api.losant.com/applications/APPLICATION_ID/keys/APPLICATION_KEY_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If applicationKey was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if applicationKey was not found |

<br/>

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**/keys/**`APPLICATION_KEY_ID`**

Retrieves information on an applicationKey

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| APPLICATION_KEY_ID | ID associated with the applicationKey | 575ec76c7ae143cd83dc4a96 |

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
    https://api.losant.com/applications/APPLICATION_ID/keys/APPLICATION_KEY_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Key](schemas.md#application-key) | applicationKey information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if applicationKey was not found |

<br/>

## PATCH

https://api.losant.com/applications/**`APPLICATION_ID`**/keys/**`APPLICATION_KEY_ID`**

Updates information about an applicationKey

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| APPLICATION_KEY_ID | ID associated with the applicationKey | 575ec76c7ae143cd83dc4a96 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Application Key Patch](schemas.md#application-key-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "status": "active",
  "description": "An example updated key description"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X PATCH \
    -d '{"status":"active","description":"An example updated key description"}' \
    https://api.losant.com/applications/APPLICATION_ID/keys/APPLICATION_KEY_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Key](schemas.md#application-key) | Updated applicationKey information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if applicationKey was not found |

<br/>

