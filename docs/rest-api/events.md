description: A detailed look at the various REST actions supported by the Events resource of the Losant API. Learn more.

# Events Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/events

Below are the various requests that can be performed against the
Events resource, as well as the expected
parameters and the potential responses.

## Get

Returns the events for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/events

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, events.*, or events.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: subject, id, creationDate | creationDate | subject |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | desc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: subject |  | subject |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | abnormal power to * |
| state | N | If provided, return events only in the given state. Accepted values are: new, acknowledged, resolved |  | new |

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
    https://api.losant.com/applications/APPLICATION_ID/events
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Events](schemas.md#events) | Collection of events |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Most Recent by Severity

Returns the first new event ordered by severity and then creation

### Method And Url <a name="mostRecentBySeverity-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/events/mostRecentBySeverity

### Authentication <a name="mostRecentBySeverity-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, events.*, or events.mostRecentBySeverity.

### Request Path Components <a name="mostRecentBySeverity-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="mostRecentBySeverity-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| filter | N | Filter to apply against event subjects. Supports globbing. Blank or not provided means no filtering. |  | abnormal power to * |

### Request Headers <a name="mostRecentBySeverity-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="mostRecentBySeverity-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/events/mostRecentBySeverity
```

### Successful Responses <a name="mostRecentBySeverity-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | The event, plus count of currently new events |

### Error Responses <a name="mostRecentBySeverity-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Patch

Asynchronously updates information for matching events by subject and/or current state

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/events

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, events.*, or events.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="patch-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| filterField | N | Field to filter the events to act on by. Blank or not provided means no filtering. Accepted values are: subject |  | subject |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | abnormal power to * |
| state | N | If provided, act on events only in the given state. Accepted values are: new, acknowledged, resolved |  | new |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Event Patch](schemas.md#event-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "state": "acknowledged",
  "comment": "Looking into this issue"
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"state":"acknowledged","comment":"Looking into this issue"}' \
    https://api.losant.com/applications/APPLICATION_ID/events
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If the bulk update has been successfully started |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application is not found |

## Post

Create a new event for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/events

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, events.*, or events.post.

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
the [Event Post](schemas.md#event-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "level": "info",
  "state": "new",
  "subject": "Power levels critical",
  "message": "Power levels on device 432 have surpassed critical thresholds"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"level":"info","state":"new","subject":"Power levels critical","message":"Power levels on device 432 have surpassed critical thresholds"}' \
    https://api.losant.com/applications/APPLICATION_ID/events
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Event](schemas.md#event) | Successfully created event |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
| 429 | [Error](schemas.md#error) | Error if event creation rate limit exceeded |
