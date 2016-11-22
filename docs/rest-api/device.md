# Device Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

Below are the various requests that can be performed against the
Device resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

Deletes a device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If device was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## POST - /export

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/export

Creates a device data export (to be emailed to the requestor). Defaults to all data.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start time of export (ms since epoch - 0 means now, negative is relative to now) | 1 | 1465790400000 |
| end | N | End time of export (ms since epoch - 0 means now, negative is relative to now) | 0 | 1465790400000 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/export
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If generation of export was successfully started |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

Retrieves information on a device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device](schemas.md#device) | Device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## GET - /command

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/command

Retrieve the last known commands(s) sent to the device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max command entries to return (ordered by time descending) | 1 | 10 |
| since | N | Look for command entries since this time (ms since epoch) |  | 1465790400000 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/command
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Commands](schemas.md#device-commands) | Recent device commands |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## GET - /logs

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/logs

Retrieve the recent log entries about the device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max log entries to return (ordered by time descending) | 1 | 10 |
| since | N | Look for log entries since this time (ms since epoch) |  | 1465790400000 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/logs
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device Log](schemas.md#device-log) | Recent log entries |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## GET - /state

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/state

Retrieve the last known state(s) of the device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| limit | N | Max state entries to return (ordered by time descending) | 1 | 10 |
| since | N | Look for state entries since this time (ms since epoch) |  | 1465790400000 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/state
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device States](schemas.md#device-states) | Recent device states |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## PATCH

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**

Updates information about a device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Device Patch](schemas.md#device-patch) schema.  For example, the following would be a
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
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Device","description":"Description of my updated device","tags":[{"key":"TagKey","value":"TagValue"}],"attributes":[{"name":"voltage","dataType":"number"}],"deviceClass":"standalone"}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Device](schemas.md#device) | Updated device information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## DELETE - /data

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/data

Removes all device data for the specified time range. Defaults to all data.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start time of export (ms since epoch - 0 means now, negative is relative to now) | 1 | 1465790400000 |
| end | N | End time of export (ms since epoch - 0 means now, negative is relative to now) | 0 | 1465790400000 |

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
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/data
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If data removal was successfully started |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## POST - /command

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/command

Send a command to a device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Device Command](schemas.md#device-command) schema.  For example, the following would be a
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
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"time":"2016-06-13T04:00:00.000Z","name":"myCommand","payload":[1,1,2,3,5]}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/command
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If command was successfully sent |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

## POST - /state

https://api.losant.com/applications/**`APPLICATION_ID`**/devices/**`DEVICE_ID`**/state

Send the current state of the device

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| DEVICE_ID | ID associated with the device | 575ecf887ae143cd83dc4aa2 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Single or Multiple Device States](schemas.md#single-or-multiple-device-states) schema.  For example, the following would be a
valid body for this request:

```json
{
  "time": "2016-06-13T04:00:00.000Z",
  "data": {
    "voltage": 22.4
  }
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"time":"2016-06-13T04:00:00.000Z","data":{"voltage":22.4}}' \
    https://api.losant.com/applications/APPLICATION_ID/devices/DEVICE_ID/state
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If state was successfully received |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

<br/>

