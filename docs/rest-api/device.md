description: A detailed look at the various REST actions supported by the Device resource of the Losant API. Learn more.

# Device Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

Below are the various requests that can be performed against the
Device resource, as well as the expected
parameters and the potential responses.

## Command Stream

Attach to a real time stream of command messages to this device using Server Sent Events (SSE)

### Method And Url <a name="commandStream-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/commandStream

### Authentication <a name="commandStream-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.commandStream.

### Request Path Components <a name="commandStream-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="commandStream-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| keepAliveInterval | N | Number of seconds between keepalive messages | 2 | keepAliveInterval&#x3D;2 |

### Request Headers <a name="commandStream-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="commandStream-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/commandStream
```

### SSE Stream for a Successful Response  <a name="commandStream-successful-responses"></a>

SSE stream of new command messages for this device

| SSE Event Name | Type | Description |
| -------------- | ---- | ----------- |
| deviceCommand | [Device Command](schemas.md#device-command) | An SSE event representing a single device command |

### Error Responses <a name="commandStream-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Delete

Deletes a device

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, device.*, or device.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If device was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Export

Creates a device data export. Defaults to all data.

### Method And Url <a name="export-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/export

### Authentication <a name="export-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.export.

### Request Path Components <a name="export-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="export-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start time of export (ms since epoch - 0 means now, negative is relative to now) | 1 | start&#x3D;1465790400000 |
| end | N | End time of export (ms since epoch - 0 means now, negative is relative to now) | 0 | end&#x3D;1465790400000 |
| email | N | Email address to send export to. Defaults to current user&#x27;s email. |  | email&#x3D;email@example.com |
| callbackUrl | N | Callback URL to call with export result. |  | callbackUrl&#x3D;https://example.com/cburl |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/export
```

### Successful Responses <a name="export-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If generation of export was successfully started |

### Error Responses <a name="export-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Get

Retrieves information on a device

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| excludeConnectionInfo | N | If set, do not return connection info |  | excludeConnectionInfo&#x3D;true |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device](schemas.md#device) | Device information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Get Command

Retrieve the last known commands(s) sent to the device

### Method And Url <a name="getCommand-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/command

### Authentication <a name="getCommand-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getCommand.

### Request Path Components <a name="getCommand-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="getCommand-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max command entries to return (ordered by time descending) | 1 | limit&#x3D;10 |
| since | N | Look for command entries since this time (ms since epoch) |  | since&#x3D;1465790400000 |

### Request Headers <a name="getCommand-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getCommand-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/command
```

### Successful Responses <a name="getCommand-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Commands](schemas.md#device-commands) | Recent device commands |

### Error Responses <a name="getCommand-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Get Composite State

Retrieve the composite last complete state of the device

### Method And Url <a name="getCompositeState-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/compositeState

### Authentication <a name="getCompositeState-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getCompositeState.

### Request Path Components <a name="getCompositeState-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="getCompositeState-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start of time range to look at to build composite state | 1 | start&#x3D;1465790400000 |
| end | N | End of time range to look at to build composite state | 0 | end&#x3D;1465790400000 |

### Request Headers <a name="getCompositeState-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getCompositeState-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/compositeState
```

### Successful Responses <a name="getCompositeState-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Composite Device State](schemas.md#composite-device-state) | Composite last state of the device |

### Error Responses <a name="getCompositeState-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Get Log Entries

Retrieve the recent log entries about the device

### Method And Url <a name="getLogEntries-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/logs

### Authentication <a name="getLogEntries-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getLogEntries.

### Request Path Components <a name="getLogEntries-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="getLogEntries-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max log entries to return (ordered by time descending) | 1 | limit&#x3D;10 |
| since | N | Look for log entries since this time (ms since epoch) |  | since&#x3D;1465790400000 |

### Request Headers <a name="getLogEntries-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getLogEntries-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/logs
```

### Successful Responses <a name="getLogEntries-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Log](schemas.md#device-log) | Recent log entries |

### Error Responses <a name="getLogEntries-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Get State

Retrieve the last known state(s) of the device

### Method And Url <a name="getState-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/state

### Authentication <a name="getState-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.getState.

### Request Path Components <a name="getState-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="getState-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max state entries to return (ordered by time descending) | 1 | limit&#x3D;10 |
| since | N | Look for state entries since this time (ms since epoch) |  | since&#x3D;1465790400000 |

### Request Headers <a name="getState-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="getState-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/state
```

### Successful Responses <a name="getState-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device States](schemas.md#device-states) | Recent device states |

### Error Responses <a name="getState-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Patch

Updates information about a device

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, device.*, or device.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Device Patch](schemas.md#device-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Device",
  "description": "Description of my updated device",
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
    -d '{"name":"My Updated Device","description":"Description of my updated device","tags":[{"key":"TagKey","value":"TagValue"}],"attributes":[{"name":"voltage","dataType":"number"}],"deviceClass":"standalone"}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device](schemas.md#device) | Updated device information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Remove Data

Removes all device data for the specified time range. Defaults to all data.

### Method And Url <a name="removeData-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/data

### Authentication <a name="removeData-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, device.*, or device.removeData.

### Request Path Components <a name="removeData-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="removeData-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start time of export (ms since epoch - 0 means now, negative is relative to now) | 1 | start&#x3D;1465790400000 |
| end | N | End time of export (ms since epoch - 0 means now, negative is relative to now) | 0 | end&#x3D;1465790400000 |

### Request Headers <a name="removeData-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="removeData-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/data
```

### Successful Responses <a name="removeData-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If data removal was successfully started |

### Error Responses <a name="removeData-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Send Command

Send a command to a device

### Method And Url <a name="sendCommand-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/command

### Authentication <a name="sendCommand-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Device, all.Organization, all.User, device.*, or device.sendCommand.

### Request Path Components <a name="sendCommand-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Headers <a name="sendCommand-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="sendCommand-body"></a>

The body of the request should be serialized JSON that validates against
the [Device Command](schemas.md#device-command) schema. For example, the following would be a
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
  ]
}
```

### Curl Example <a name="sendCommand-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"time":"2016-06-13T04:00:00.000Z","name":"myCommand","payload":[1,1,2,3,5]}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/command
```

### Successful Responses <a name="sendCommand-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If command was successfully sent |

### Error Responses <a name="sendCommand-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Send State

Send the current state of the device

### Method And Url <a name="sendState-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/state

### Authentication <a name="sendState-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Device, all.Organization, all.User, device.*, or device.sendState.

### Request Path Components <a name="sendState-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Headers <a name="sendState-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="sendState-body"></a>

The body of the request should be serialized JSON that validates against
the [Single or Multiple Device States](schemas.md#single-or-multiple-device-states) schema. For example, the following would be a
valid body for this request:

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "data": {
    "voltage": 22.4
  }
}
```

### Curl Example <a name="sendState-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"time":"2016-06-13T04:00:00.000Z","data":{"voltage":22.4}}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/state
```

### Successful Responses <a name="sendState-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If state was successfully received |

### Error Responses <a name="sendState-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Set Connection Status

Set the current connection status of the device

### Method And Url <a name="setConnectionStatus-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/setConnectionStatus

### Authentication <a name="setConnectionStatus-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Device, all.Organization, all.User, device.*, or device.setConnectionStatus.

### Request Path Components <a name="setConnectionStatus-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Headers <a name="setConnectionStatus-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="setConnectionStatus-body"></a>

The body of the request should be serialized JSON that validates against
the [Device Connection Status](schemas.md#device-connection-status) schema. For example, the following would be a
valid body for this request:

```json
{
  "status": "connected"
}
```

### Curl Example <a name="setConnectionStatus-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"status":"connected"}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/setConnectionStatus
```

### Successful Responses <a name="setConnectionStatus-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If connection status was successfully applied |

### Error Responses <a name="setConnectionStatus-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## State Stream

Attach to a real time stream of state messages from this device using Server Sent Events (SSE)

### Method And Url <a name="stateStream-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/stateStream

### Authentication <a name="stateStream-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Device, all.Device.read, all.Organization, all.Organization.read, all.User, all.User.read, device.*, or device.stateStream.

### Request Path Components <a name="stateStream-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

### Request Query Parameters <a name="stateStream-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| keepAliveInterval | N | Number of seconds between keepalive messages | 2 | keepAliveInterval&#x3D;2 |

### Request Headers <a name="stateStream-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="stateStream-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/stateStream
```

### SSE Stream for a Successful Response  <a name="stateStream-successful-responses"></a>

SSE stream of new state messages for this device

| SSE Event Name | Type | Description |
| -------------- | ---- | ----------- |
| deviceState | [Device State](schemas.md#device-state) | An SSE event representing a single device state |

### Error Responses <a name="stateStream-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |
