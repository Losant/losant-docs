---
description: A detailed look at the various REST actions supported by the Application resource of the Losant API. Learn more.
---

# Application Actions

https://api.losant.com/applications/**`APPLICATION_ID`**

Below are the various requests that can be performed against the
Application resource, as well as the expected
parameters and the potential responses.

## Archive Data

Returns success when a job has been enqueued to archive this application&#x27;s device data for a given day

### Method And Url <a name="archiveData-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/archiveData

### Authentication <a name="archiveData-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.archiveData.

### Request Path Components <a name="archiveData-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="archiveData-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| date | Y | The date to archive data (ms since epoch), it must be within the archive time range older than 31 days and newer than the organizations dataTTL |  | date&#x3D;1518556791829 |

### Request Headers <a name="archiveData-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="archiveData-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/archiveData?date=1518556791829
```

### Successful Responses <a name="archiveData-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Enqueued a job to archive this applications device data |

### Error Responses <a name="archiveData-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Backfill Archive Data

Returns success when a job has been enqueued to backfill all current data to it&#x27;s archive

### Method And Url <a name="backfillArchiveData-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/backfillArchiveData

### Authentication <a name="backfillArchiveData-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.backfillArchiveData.

### Request Path Components <a name="backfillArchiveData-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="backfillArchiveData-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="backfillArchiveData-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/backfillArchiveData
```

### Successful Responses <a name="backfillArchiveData-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Enqueued a job to backfill device data to this application archive location |

### Error Responses <a name="backfillArchiveData-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Delete

Deletes an application

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

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
    https://api.losant.com/applications/APPLICATION_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If application was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Get

Retrieves information on an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

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
    https://api.losant.com/applications/APPLICATION_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](schemas.md#application) | Application information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Mqtt Publish Message

Publishes the given message to the given MQTT topic

### Method And Url <a name="mqttPublishMessage-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/mqttPublishMessage

### Authentication <a name="mqttPublishMessage-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.mqttPublishMessage.

### Request Path Components <a name="mqttPublishMessage-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="mqttPublishMessage-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="mqttPublishMessage-body"></a>

The body of the request should be serialized JSON that validates against
the [MQTT Publish Body](schemas.md#mqtt-publish-body) schema. For example, the following would be a
valid body for this request:

```json
{
  "topic": "an/mqtt/topic",
  "message": "The MQTT message!"
}
```

### Curl Example <a name="mqttPublishMessage-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"topic":"an/mqtt/topic","message":"The MQTT message!"}' \
    https://api.losant.com/applications/APPLICATION_ID/mqttPublishMessage
```

### Successful Responses <a name="mqttPublishMessage-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | Message successfully published |

### Error Responses <a name="mqttPublishMessage-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Mqtt Subscription Stream

Attach to a real time stream of state messages for the given MQTT topic using Server Sent Events (SSE)

### Method And Url <a name="mqttSubscriptionStream-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/mqttSubscriptionStream

### Authentication <a name="mqttSubscriptionStream-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.mqttSubscriptionStream.

### Request Path Components <a name="mqttSubscriptionStream-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="mqttSubscriptionStream-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| keepAliveInterval | N | Number of seconds between keepalive messages | 2 | keepAliveInterval&#x3D;2 |
| topic | Y | The MQTT topic to subscribe to |  | topic&#x3D;my/topic |

### Request Headers <a name="mqttSubscriptionStream-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="mqttSubscriptionStream-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/mqttSubscriptionStream?topic=my%2Ftopic
```

### SSE Stream for a Successful Response  <a name="mqttSubscriptionStream-successful-responses"></a>

SSE stream of mqtt messages for the requested topic

| SSE Event Name | Type | Description |
| -------------- | ---- | ----------- |
| mqttMessage | [MQTT Publish Body](schemas.md#mqtt-publish-body) | An SSE event representing a single mqtt payload |

### Error Responses <a name="mqttSubscriptionStream-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if device was not found |

## Patch

Updates information about an application

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, application.*, or application.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Application Patch](schemas.md#application-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Application",
  "description": "Description of my updated application"
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Application","description":"Description of my updated application"}' \
    https://api.losant.com/applications/APPLICATION_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application](schemas.md#application) | Updated application information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Payload Counts

Returns payload counts for the time range specified for this application

### Method And Url <a name="payloadCounts-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/payloadCounts

### Authentication <a name="payloadCounts-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.payloadCounts.

### Request Path Components <a name="payloadCounts-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="payloadCounts-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start of range for payload count query (ms since epoch) | -2592000000 | start&#x3D;0 |
| end | N | End of range for payload count query (ms since epoch) | 0 | end&#x3D;1465790400000 |

### Request Headers <a name="payloadCounts-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="payloadCounts-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/payloadCounts
```

### Successful Responses <a name="payloadCounts-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Counts](schemas.md#payload-counts) | Payload counts, by type and source |

### Error Responses <a name="payloadCounts-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Search

Search across an application&#x27;s resources by target identifier

### Method And Url <a name="search-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/search

### Authentication <a name="search-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, application.*, or application.search.

### Request Path Components <a name="search-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID of the associated application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="search-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| filter | Y | The partial resource name being searched for |  | filter&#x3D;my dev |

### Request Headers <a name="search-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="search-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/search?filter=my%20dev
```

### Successful Responses <a name="search-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Application Search Result](schemas.md#application-search-result) | An array of resource ids, names, descriptions, and types matching the search query |

### Error Responses <a name="search-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application is not found |
