description: A detailed look at the various REST actions supported by the Data Table Row resource of the Losant API. Learn more.

# Data Table Row Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/**`ROW_ID`**

Below are the various requests that can be performed against the
Data Table Row resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a data table row

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/**`ROW_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTableRow.*, or dataTableRow.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |
| ROW_ID | ID associated with the data table row | 596f832b128eda5cfe765443 |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/ROW_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If data table row was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table row was not found |

<br/>

## Get

Retrieves the data table row

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/**`ROW_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, dataTableRow.*, or dataTableRow.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |
| ROW_ID | ID associated with the data table row | 596f832b128eda5cfe765443 |

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
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/ROW_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Row](schemas.md#data-table-row) | Data table row information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table row was not found |

<br/>

## Patch

Updates the data table row

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/data-tables/**`DATA_TABLE_ID`**/rows/**`ROW_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, dataTableRow.*, or dataTableRow.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DATA_TABLE_ID | ID associated with the data table | 575ed78e7ae143cd83dc4aab |
| ROW_ID | ID associated with the data table row | 596f832b128eda5cfe765443 |

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
    -X PATCH \
    -d '{"myColumn1":"myValue"}' \
    https://api.losant.com/applications/APPLICATION_ID/data-tables/DATA_TABLE_ID/rows/ROW_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Data Table Row](schemas.md#data-table-row) | Updated data table row information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if data table row was not found |

<br/>

