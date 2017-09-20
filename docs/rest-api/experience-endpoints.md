description: A detailed look at the various REST actions supported by the Experience Endpoints resource of the Losant API. Learn more.

# Experience Endpoints Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints

Below are the various requests that can be performed against the
Experience Endpoints resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience endpoints for an application

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoints.*, or experienceEndpoints.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: order, method, route, id, creationDate, requestCount | order | position |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: method, route |  | email |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*route |
| experienceGroupId | N | Filter endpoints to those only in the specified group |  | 575ec8687ae143cd83dc4a97 |
| requestCountDuration | N | If set, a count of recent requests is included on each endpoint for the duration requested (milliseconds) |  | 86400000 |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Endpoints](schemas.md#experience-endpoints) | Collection of experience endpoints |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new experience endpoint for an application

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceEndpoints.*, or experienceEndpoints.post.

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
the [Experience Endpoint Post](schemas.md#experience-endpoint-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "route": "/my/route/{id}",
  "method": "get",
  "access": "public"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"route":"/my/route/{id}","method":"get","access":"public"}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience Endpoint](schemas.md#experience-endpoint) | Successfully created experience endpoint |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Stats

Get statistics about endpoint requests

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints/stats

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoints.*, or experienceEndpoints.stats.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| statGrouping | N | Field to group the statistics by. Accepted values are: statusCode, endpointId | statusCode | statusCode |
| duration | N | Duration in milliseconds | 86400000 | 86400000 |
| resolution | N | Resolution in milliseconds | 3600000 | 3600000 |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints/stats
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Endpoint Stats](schemas.md#experience-endpoint-stats) | Statistics for endpoint requests |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

