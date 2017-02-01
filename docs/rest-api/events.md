# Events Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/events

Below are the various requests that can be performed against the
Events resource, as well as the expected
parameters and the potential responses.

## Get

Returns the events for an application

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/events

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, events.*, or events.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: subject, id, creationDate | creationDate | subject |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | desc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: subject |  | subject |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | abnormal power to * |
| state | N | If provided, return events only in the given state. Accepted values are: new, acknowledged, resolved |  | new |

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
    https://api.losant.com/applications/APPLICATION_ID/events
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Events](schemas.md#events) | Collection of events |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Most Recent by Severity

Returns the first new event ordered by severity and then creation

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/events/mostRecentBySeverity

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, events.*, or events.mostRecentBySeverity.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| filter | N | Filter to apply against event subjects. Supports globbing. Blank or not provided means no filtering. |  | abnormal power to * |

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
    https://api.losant.com/applications/APPLICATION_ID/events/mostRecentBySeverity
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | undefined | The event, plus count of currently new events |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Patch

Asynchronously updates information for matching events by subject and/or current state

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/events

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, events.*, or events.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| filterField | N | Field to filter the events to act on by. Blank or not provided means no filtering. Accepted values are: subject |  | subject |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | abnormal power to * |
| state | N | If provided, act on events only in the given state. Accepted values are: new, acknowledged, resolved |  | new |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Event Patch](schemas.md#event-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "state": "acknowledged",
  "comment": "Looking into this issue"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"state":"acknowledged","comment":"Looking into this issue"}' \
    https://api.losant.com/applications/APPLICATION_ID/events
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If the bulk update has been successfully started |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application is not found |

<br/>

## Post

Create a new event for an application

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/events

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, events.*, or events.post.

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
the [Event Post](schemas.md#event-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "level": "info",
  "state": "new",
  "subject": "Power levels critical",
  "message": "Power levels on device 432 have surpassed critical thresholds"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"level":"info","state":"new","subject":"Power levels critical","message":"Power levels on device 432 have surpassed critical thresholds"}' \
    https://api.losant.com/applications/APPLICATION_ID/events
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Event](schemas.md#event) | Successfully created event |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
| 429 | [Error](schemas.md#error) | Error if event creation rate limit exceeded |

<br/>

