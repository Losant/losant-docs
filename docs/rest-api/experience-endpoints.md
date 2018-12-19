---
description: A detailed look at the various REST actions supported by the Experience Endpoints resource of the Losant API. Learn more.
---

# Experience Endpoints Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints

Below are the various requests that can be performed against the
Experience Endpoints resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience endpoints for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoints.*, or experienceEndpoints.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: order, method, route, id, creationDate, requestCount, lastUpdated | order | sortField&#x3D;position |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: method, route |  | filterField&#x3D;method |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;my*route |
| experienceGroupId | N | Filter endpoints to those only in the specified group |  | experienceGroupId&#x3D;575ec8687ae143cd83dc4a97 |
| requestCountDuration | N | If set, a count of recent requests is included on each endpoint for the duration requested (milliseconds) |  | requestCountDuration&#x3D;86400000 |
| version | N | Return the experience endpoints belonging to this version | develop | version&#x3D;develop |

### Request Headers <a name="get-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="get-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Endpoints](schemas.md#experience-endpoints) | Collection of experience endpoints |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new experience endpoint for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceEndpoints.*, or experienceEndpoints.post.

### Request Path Components <a name="post-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

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

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"route":"/my/route/{id}","method":"get","access":"public"}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience Endpoint](schemas.md#experience-endpoint) | Successfully created experience endpoint |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Stats

Get statistics about endpoint requests

### Method And Url <a name="stats-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/endpoints/stats

### Authentication <a name="stats-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceEndpoints.*, or experienceEndpoints.stats.

### Request Path Components <a name="stats-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="stats-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| statGrouping | N | Field to group the statistics by. Accepted values are: statusCode, endpointId, version, domain | statusCode | statGrouping&#x3D;statusCode |
| duration | N | Duration in milliseconds | 86400000 | duration&#x3D;86400000 |
| resolution | N | Resolution in milliseconds | 3600000 | resolution&#x3D;3600000 |
| versionFilter | N | Filters the stats to a particular experience version |  | versionFilter&#x3D;myVersion |
| domainFilter | N | Filters the stats to a particular experience domain or slug |  | domainFilter&#x3D;mycustomdomain.com |
| statusCodeFilter | N | Filters the stats to a particular status code |  | statusCodeFilter&#x3D;200 |
| endpointIdFilter | N | Filters the stats to a particular endpoint |  | endpointIdFilter&#x3D;575ec8687ae143cd83dc4a98 |

### Request Headers <a name="stats-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="stats-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/experience/endpoints/stats
```

### Successful Responses <a name="stats-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Endpoint Stats](schemas.md#experience-endpoint-stats) | Statistics for endpoint requests |

### Error Responses <a name="stats-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
