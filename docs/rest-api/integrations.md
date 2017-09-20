description: A detailed look at the various REST actions supported by the Integrations resource of the Losant API. Learn more.

# Integrations Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/integrations

Below are the various requests that can be performed against the
Integrations resource, as well as the expected
parameters and the potential responses.

## Get

Returns the integrations for an application

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/integrations

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, integrations.*, or integrations.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, integrationType | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name, integrationType |  | integrationType |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*integration |

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
    https://api.losant.com/applications/APPLICATION_ID/integrations
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Integrations](schemas.md#integrations) | Collection of integrations |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new integration for an application

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/integrations

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, integrations.*, or integrations.post.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Integrations Post](schemas.md#integrations-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "Example Integrations",
  "integrationType": "mqtt",
  "topics": [
    "myTopic"
  ],
  "mqttConfig": {
    "clientId": "exampleClientId",
    "username": "exampleUsername",
    "password": "examplePassword",
    "port": 8883,
    "protocol": "mqtts",
    "host": "broker.example.com"
  }
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"Example Integrations","integrationType":"mqtt","topics":["myTopic"],"mqttConfig":{"clientId":"exampleClientId","username":"exampleUsername","password":"examplePassword","port":8883,"protocol":"mqtts","host":"broker.example.com"}}' \
    https://api.losant.com/applications/APPLICATION_ID/integrations
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Integrations](schemas.md#integrations) | Successfully created integration |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

