# Experience Endpoint Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints/**`EXPERIENCE_ENDPOINT_ID`**

Below are the various requests that can be performed against the
Experience Endpoint resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an experience endpoint

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints/**`EXPERIENCE_ENDPOINT_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceEndpoint.*, or experienceEndpoint.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_ENDPOINT_ID | ID associated with the experience endpoint | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints/EXPERIENCE_ENDPOINT_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If experience endpoint was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience endpoint was not found |

<br/>

## Get

Retrieves information on an experience endpoint

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints/**`EXPERIENCE_ENDPOINT_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoint.*, or experienceEndpoint.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_ENDPOINT_ID | ID associated with the experience endpoint | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints/EXPERIENCE_ENDPOINT_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Endpoint](schemas.md#experience-endpoint) | Experience endpoint information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience endpoint was not found |

<br/>

## Patch

Updates information about an experience endpoint

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints/**`EXPERIENCE_ENDPOINT_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceEndpoint.*, or experienceEndpoint.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_ENDPOINT_ID | ID associated with the experience endpoint | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Experience Endpoint Patch](schemas.md#experience-endpoint-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "access": "group",
  "experienceGroupIds": [
    "58c1de6f8f812590d8e82983"
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
    -d '{"access":"group","experienceGroupIds":["58c1de6f8f812590d8e82983"]}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints/EXPERIENCE_ENDPOINT_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Endpoint](schemas.md#experience-endpoint) | Updated experience endpoint information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience endpoint was not found |

<br/>

