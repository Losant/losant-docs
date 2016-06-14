# Device Recipe Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

Below are the various requests that can be performed against the
Device Recipe resource, as well as the expected
parameters and the potential responses.

## POST - /bulkCreate

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**/bulkCreate

Bulk creates devices using this recipe from a CSV

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Device Recipe Bulk Create Post](schemas.md#device-recipe-bulk-create-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "nameColumn": "myNameColumn",
  "descriptionColumn": "column2",
  "csv": "a,comma,separated,string,of,input,data"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"nameColumn":"myNameColumn","descriptionColumn":"column2","csv":"a,comma,separated,string,of,input,data"}' \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID/bulkCreate
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Device Recipe Bulk Create](schemas.md#device-recipe-bulk-create) | If devices were sucessfully created |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

<br/>

## DELETE

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

Deletes a device recipe

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If device recipe was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

<br/>

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

Retrieves information on a device recipe

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

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
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Recipe](schemas.md#device-recipe) | Device recipe information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

<br/>

## PATCH

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

Updates information about a device recipe

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Device Recipe Patch](schemas.md#device-recipe-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Device Recipe",
  "deviceName": "Future device name",
  "description": "Description of my updated device recipe",
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
    -X PATCH \
    -d '{"name":"My Updated Device Recipe","deviceName":"Future device name","description":"Description of my updated device recipe","deviceDescription":"Future device description","tags":[{"key":"TagKey","value":"TagValue"}],"attributes":[{"name":"voltage","dataType":"number"}],"deviceClass":"standalone"}' \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Recipe](schemas.md#device-recipe) | Updated device recipe information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

<br/>

