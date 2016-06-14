# Application Actions

https://api.losant.com/applications/**`APPLICATION_ID`**

Below are the various requests that can be performed against the
Application resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/applications/**`APPLICATION_ID`**

Deletes an application

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

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
    https://api.losant.com/applications/APPLICATION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If application was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**

Retrieves information on an application

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

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
    https://api.losant.com/applications/APPLICATION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](schemas.md#application) | Application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## PATCH

https://api.losant.com/applications/**`APPLICATION_ID`**

Updates information about an application

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Application Patch](schemas.md#application-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Application",
  "description": "Description of my updated application"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Application","description":"Description of my updated application"}' \
    https://api.losant.com/applications/APPLICATION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](schemas.md#application) | Updated application information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

