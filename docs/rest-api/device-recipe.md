description: A detailed look at the various REST actions supported by the Device Recipe resource of the Losant API. Learn more.

# Device Recipe Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

Below are the various requests that can be performed against the
Device Recipe resource, as well as the expected
parameters and the potential responses.

## Bulk Create

Bulk creates devices using this recipe from a CSV

### Method And Url <a name="bulkCreate-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**/bulkCreate

### Authentication <a name="bulkCreate-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, deviceRecipe.*, or deviceRecipe.bulkCreate.

### Request Path Components <a name="bulkCreate-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

### Request Headers <a name="bulkCreate-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="bulkCreate-body"></a>

The body of the request should be serialized JSON that validates against
the [Device Recipe Bulk Create Post](schemas.md#device-recipe-bulk-create-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "nameColumn": "myNameColumn",
  "descriptionColumn": "column2",
  "csv": "a,comma,separated,string,of,input,data"
}
```

### Curl Example <a name="bulkCreate-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"nameColumn":"myNameColumn","descriptionColumn":"column2","csv":"a,comma,separated,string,of,input,data"}' \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID/bulkCreate
```

### Successful Responses <a name="bulkCreate-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Device Recipe Bulk Create](schemas.md#device-recipe-bulk-create) | If devices were successfully created |
| 202 | [Device Recipe Bulk Create Enqueue](schemas.md#device-recipe-bulk-create-enqueue) | If devices were enqueued to be created |

### Error Responses <a name="bulkCreate-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

## Delete

Deletes a device recipe

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, deviceRecipe.*, or deviceRecipe.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

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
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If device recipe was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

## Get

Retrieves information on a device recipe

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, deviceRecipe.*, or deviceRecipe.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

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
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Recipe](schemas.md#device-recipe) | Device recipe information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |

## Patch

Updates information about a device recipe

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/device-recipes/**`DEVICE_RECIPE_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, deviceRecipe.*, or deviceRecipe.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_RECIPE_ID | ID associated with the device recipe | 575ecec57ae143cd83dc4a9f |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Device Recipe Patch](schemas.md#device-recipe-patch) schema. For example, the following would be a
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

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Device Recipe","deviceName":"Future device name","description":"Description of my updated device recipe","deviceDescription":"Future device description","tags":[{"key":"TagKey","value":"TagValue"}],"attributes":[{"name":"voltage","dataType":"number"}],"deviceClass":"standalone"}' \
    https://api.losant.com/applications/APPLICATION_ID/device-recipes/DEVICE_RECIPE_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Recipe](schemas.md#device-recipe) | Updated device recipe information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device recipe was not found |
