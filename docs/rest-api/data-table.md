description: A detailed look at the various REST actions supported by the Data Table resource of the Losant API. Learn more.

# Data Table Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

Below are the various requests that can be performed against the
Data Table resource, as well as the expected
parameters and the potential responses.

## Add Column

Adds a new column to this data table

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/column

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.addColumn.

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
the [Data Table Column](schemas.md#data-table-column) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "myOptionalColumn",
  "dataType": "string",
  "constraint": "optional",
  "defaultValue": "aDefault"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"myOptionalColumn","dataType":"string","constraint":"optional","defaultValue":"aDefault"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/column
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Updated data table information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

## Delete

Deletes a data table

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If data table was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

## Get

Retrieves information on a data table

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTable.*, or dataTable.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Data table information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

## Patch

Updates information about a data table

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.patch.

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
the [Data Table Patch](schemas.md#data-table-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Data Table"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Data Table"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Updated data table information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

## Remove Column

Removes a column from this data table

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/column

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTable.*, or dataTable.removeColumn.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| columnName | Y | Name of the column to remove |  | myColumnName |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/column?columnName=myColumnName
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table](schemas.md#data-table) | Updated data table information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table was not found |

<br/>

