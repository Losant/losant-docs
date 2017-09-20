description: A detailed look at the various REST actions supported by the Data resource of the Losant API. Learn more.

# Data Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/data

Below are the various requests that can be performed against the
Data resource, as well as the expected
parameters and the potential responses.

## Last Value Query

Returns the last known data for the given attribute

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data/last-value-query

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, data.*, or data.lastValueQuery.

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
the [Last Value Query](schemas.md#last-value-query) schema. For example, the following would be a
valid body for this request:

```json
{
  "deviceIds": [
    "575ecf887ae143cd83dc4aa2",
    "575ef5c97ae143cd83dc4aac"
  ],
  "attribute": "voltage"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"deviceIds":["575ecf887ae143cd83dc4aa2","575ef5c97ae143cd83dc4aac"],"attribute":"voltage"}' \
    https://api.losant.com/applications/APPLICATION_ID/data/last-value-query
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Last Value Data](schemas.md#last-value-data) | Last known data for the requested attribute |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Time Series Query

Returns the data for the given query

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data/time-series-query

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, data.*, or data.timeSeriesQuery.

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
the [Time Series Query](schemas.md#time-series-query) schema. For example, the following would be a
valid body for this request:

```json
{
  "end": 0,
  "duration": 600000,
  "resolution": 300000,
  "aggregation": "MEAN",
  "attributes": [
    "voltage"
  ],
  "deviceTags": {
    "key": "floor",
    "value": "8"
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
    -d '{"end":0,"duration":600000,"resolution":300000,"aggregation":"MEAN","attributes":["voltage"],"deviceTags":{"key":"floor","value":"8"}}' \
    https://api.losant.com/applications/APPLICATION_ID/data/time-series-query
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Time Series Data](schemas.md#time-series-data) | Data for requested time range |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

