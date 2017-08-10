# Data Table Rows Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows

Below are the various requests that can be performed against the
Data Table Rows resource, as well as the expected
parameters and the potential responses.

## Get

Returns the rows for a data table

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTableRows.*, or dataTableRows.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortColumn | N | Column to sort the rows by |  | myColumnName |
| sortDirection | N | Direction to sort the rows by. Accepted values are: asc, desc | asc | asc |
| limit | N | How many rows to return | 1000 | 0 |
| offset | N | How many rows to skip | 0 | 0 |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Rows](schemas.md#data-table-rows) | Collection of data table rows |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

## Post

Inserts a new row into a data table

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTableRows.*, or dataTableRows.post.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Data Table Row Insert/Update](schemas.md#data-table-row-insert/update) schema. For example, the following would be a
valid body for this request:

```json
{
  "myColumn1": "myValue"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"myColumn1":"myValue"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Data Table Row](schemas.md#data-table-row) | Successfully created data table row |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

## Query

Queries for rows from a data table

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/query

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTableRows.*, or dataTableRows.query.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortColumn | N | Column to sort the rows by |  | myColumnName |
| sortDirection | N | Direction to sort the rows by. Accepted values are: asc, desc | asc | asc |
| limit | N | How many rows to return | 1000 | 0 |
| offset | N | How many rows to skip | 0 | 0 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Data Table Query](schemas.md#data-table-query) schema. For example, the following would be a
valid body for this request:

```json
{
  "$or": [
    {
      "myCol1": {
        "$ne": 0
      }
    },
    {
      "myCol2": 5
    }
  ]
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/query
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Rows](schemas.md#data-table-rows) | Collection of data table rows |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

