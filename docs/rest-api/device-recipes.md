# Device Recipes Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes

Below are the various requests that can be performed against the
Device Recipes resource, as well as the expected
parameters and the potential responses.

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes

Returns the device recipes for an application

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * recipe |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Recipes](schemas.md#device-recipes) | Collection of device recipes |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## POST

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes

Create a new device recipe for an application

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
the [Device Recipe Post](schemas.md#device-recipe-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Device Recipe",
  "deviceName": "Future device name",
  "description": "Description of my new device recipe",
  "deviceDescription": "Future device description",
  "tags": [
    {
      "key": "TagKey",
      "value": "TagValue"
    }
  ],
  "attributes": [
    {
      "name": "voltage",
      "dataType": "number"
    }
  ],
  "deviceClass": "standalone"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"name":"My New Device Recipe","deviceName":"Future device name","description":"Description of my new device recipe","deviceDescription":"Future device description","tags":[{"key":"TagKey","value":"TagValue"}],"attributes":[{"name":"voltage","dataType":"number"}],"deviceClass":"standalone"}' \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Device Recipe](schemas.md#device-recipe) | Successfully created device recipe |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

