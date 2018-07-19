description: A detailed look at the various REST actions supported by the Data Table Rows resource of the Losant API. Learn more.

# Data Table Rows Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows

Below are the various requests that can be performed against the
Data Table Rows resource, as well as the expected
parameters and the potential responses.

## Delete

Delete rows from a data table

### Method And Url <a name="delete-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/delete

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTableRows.*, or dataTableRows.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Query Parameters <a name="delete-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Limit number of rows to delete from data table | 1000 | limit&#x3D;10 |

### Request Headers <a name="delete-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="delete-body"></a>

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

### Curl Example <a name="delete-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/delete
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Rows Delete](schemas.md#data-table-rows-delete) | If request successfully deletes a set of Data Table rows |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Export

Request an export of the data table&#x27;s data

### Method And Url <a name="export-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/export

### Authentication <a name="export-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTableRows.*, or dataTableRows.export.

### Request Path Components <a name="export-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="export-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="export-body"></a>

The body of the request should be serialized JSON that validates against
the [Data Table Export](schemas.md#data-table-export) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "email@example.com",
  "query": {
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
  },
  "queryOptions": {
    "limit": 10000
  }
}
```

### Curl Example <a name="export-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/export
```

### Successful Responses <a name="export-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If request was successfully queued |

### Error Responses <a name="export-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Get

Returns the rows for a data table

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTableRows.*, or dataTableRows.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortColumn | N | Column to sort the rows by |  | sortColumn&#x3D;myColumnName |
| sortDirection | N | Direction to sort the rows by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| limit | N | How many rows to return | 1000 | limit&#x3D;0 |
| offset | N | How many rows to skip | 0 | offset&#x3D;0 |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Rows](schemas.md#data-table-rows) | Collection of data table rows |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Post

Inserts a new row into a data table

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTableRows.*, or dataTableRows.post.

### Request Path Components <a name="post-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Data Table Row Insert/Update](schemas.md#data-table-row-insert/update) schema. For example, the following would be a
valid body for this request:

```json
{
  "myColumn1": "myValue"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"myColumn1":"myValue"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Data Table Row](schemas.md#data-table-row) | Successfully created data table row |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Query

Queries for rows from a data table

### Method And Url <a name="query-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/query

### Authentication <a name="query-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTableRows.*, or dataTableRows.query.

### Request Path Components <a name="query-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Query Parameters <a name="query-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortColumn | N | Column to sort the rows by |  | sortColumn&#x3D;myColumnName |
| sortDirection | N | Direction to sort the rows by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| limit | N | How many rows to return | 1000 | limit&#x3D;0 |
| offset | N | How many rows to skip | 0 | offset&#x3D;0 |

### Request Headers <a name="query-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="query-body"></a>

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

### Curl Example <a name="query-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/query
```

### Successful Responses <a name="query-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Rows](schemas.md#data-table-rows) | Collection of data table rows |

### Error Responses <a name="query-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Truncate

Delete all data in the data table

### Method And Url <a name="truncate-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/truncate

### Authentication <a name="truncate-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTableRows.*, or dataTableRows.truncate.

### Request Path Components <a name="truncate-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="truncate-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="truncate-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/truncate
```

### Successful Responses <a name="truncate-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If request successfully deleted **all** rows in the data table, this will **not** send workflow data table deletion triggers |

### Error Responses <a name="truncate-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |
