# Integration Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/integrations/**`INTEGRATION_ID`**

Below are the various requests that can be performed against the
Integration resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an integration

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/integrations/**`INTEGRATION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, integration.*, or integration.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| INTEGRATION_ID | ID associated with the integration | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/integrations/INTEGRATION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If integration was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if integration was not found |

<br/>

## Get

Retrieves information on an integration

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/integrations/**`INTEGRATION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, integration.*, or integration.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| INTEGRATION_ID | ID associated with the integration | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/integrations/INTEGRATION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Integrations](schemas.md#integrations) | integration information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if integration was not found |

<br/>

## Patch

Updates information about an integration

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/integrations/**`INTEGRATION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, integration.*, or integration.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| INTEGRATION_ID | ID associated with the integration | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Integrations Patch](schemas.md#integrations-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "topics": [
    "differentTopic"
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
    -d '{"topics":["differentTopic"]}' \
    https://api.losant.com/applications/APPLICATION_ID/integrations/INTEGRATION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Integrations](schemas.md#integrations) | Updated integration information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if integration was not found |

<br/>

