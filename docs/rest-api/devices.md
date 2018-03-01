description: A detailed look at the various REST actions supported by the Devices resource of the Losant API. Learn more.

# Devices Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/devices

Below are the various requests that can be performed against the
Devices resource, as well as the expected
parameters and the potential responses.

## Export

Creates an export of all device metadata.

### Method And Url <a name="export-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices/export

### Authentication <a name="export-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.export.

### Request Path Components <a name="export-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="export-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| email | N | Email address to send export to. Defaults to current user&#x27;s email. |  | email@example.com |
| callbackUrl | N | Callback URL to call with export result. |  | https://example.com/cburl |

### Request Headers <a name="export-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="export-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/devices/export
```

### Successful Responses <a name="export-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If generation of export was successfully started |

### Error Responses <a name="export-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Get

Returns the devices for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, devices.*, or devices.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * device |
| deviceClass | N | Filter the devices by the given device class. Accepted values are: standalone, gateway, peripheral, floating, edgeCompute |  | standalone |
| tagFilter | N | Array of tag pairs to filter by. See [Device Tag Filter](schemas.md#device-tag-filter) for more details. |  | [Device Tag Filter Example](schemas.md#device-tag-filter-example) |

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
    https://api.losant.com/applications/APPLICATION_ID/devices
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Devices](schemas.md#devices) | Collection of devices |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new device for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, devices.*, or devices.post.

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
the [Device Post](schemas.md#device-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Device",
  "description": "Description of my new device",
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

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My New Device","description":"Description of my new device","tags":[{"key":"TagKey","value":"TagValue"}],"attributes":[{"name":"voltage","dataType":"number"}],"deviceClass":"standalone"}' \
    https://api.losant.com/applications/APPLICATION_ID/devices
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Device](schemas.md#device) | Successfully created device |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Send Command

Send a command to multiple devices

### Method And Url <a name="sendCommand-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices/command

### Authentication <a name="sendCommand-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Device, all.Organization, all.User, devices.*, or devices.sendCommand.

### Request Path Components <a name="sendCommand-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="sendCommand-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="sendCommand-body"></a>

The body of the request should be serialized JSON that validates against
the [Multi Device Command](schemas.md#multi-device-command) schema. For example, the following would be a
valid body for this request:

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "name": "myCommand",
  "payload": [
    1,
    1,
    2,
    3,
    5
  ],
  "deviceTags": [
    {
      "key": "floor",
      "value": 8
    }
  ]
}
```

### Curl Example <a name="sendCommand-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"time":"2016-06-13T04:00:00.000Z","name":"myCommand","payload":[1,1,2,3,5],"deviceTags":[{"key":"floor","value":8}]}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/command
```

### Successful Responses <a name="sendCommand-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If command was successfully sent |

### Error Responses <a name="sendCommand-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
