---
description: A detailed look at the various REST actions supported by the Data Table resource of the Losant API. Learn more.
---

# Data Table Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

Below are the various requests that can be performed against the
Data Table resource, as well as the expected
parameters and the potential responses.

## Add Column

Adds a new column to this data table

### Method And Url <a name="addColumn-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/column

### Authentication <a name="addColumn-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.addColumn.

### Request Path Components <a name="addColumn-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="addColumn-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="addColumn-body"></a>

The body of the request should be serialized JSON that validates against
the [Data Table Column](schemas.md#data-table-column) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "myColumn3",
  "dataType": "string",
  "constraint": "optional",
  "defaultValue": "aDefault"
}
```

### Curl Example <a name="addColumn-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"myColumn3","dataType":"string","constraint":"optional","defaultValue":"aDefault"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/column
```

### Successful Responses <a name="addColumn-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Updated data table information |

### Error Responses <a name="addColumn-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Delete

Deletes a data table

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="delete-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="delete-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If data table was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Get

Retrieves information on a data table

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTable.*, or dataTable.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Data table information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Patch

Updates information about a data table

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Data Table Patch](schemas.md#data-table-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Data Table"
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Data Table"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Updated data table information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

## Remove Column

Removes a column from this data table

### Method And Url <a name="removeColumn-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/column

### Authentication <a name="removeColumn-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.removeColumn.

### Request Path Components <a name="removeColumn-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

### Request Query Parameters <a name="removeColumn-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| columnName | Y | Name of the column to remove |  | columnName&#x3D;myColumnName |

### Request Headers <a name="removeColumn-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="removeColumn-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/column?columnName=myColumnName
```

### Successful Responses <a name="removeColumn-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Updated data table information |

### Error Responses <a name="removeColumn-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |
