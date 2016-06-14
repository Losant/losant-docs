# Webhook Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/webhooks/**`WEBHOOK_ID`**

Below are the various requests that can be performed against the
Webhook resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/applications/**`APPLICATION_ID`**/webhooks/**`WEBHOOK_ID`**

Deletes a webhook

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| WEBHOOK_ID | ID associated with the webhook | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/webhooks/WEBHOOK_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If webhook was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if webhook was not found |

<br/>

## GET

https://api.losant.com/applications/**`APPLICATION_ID`**/webhooks/**`WEBHOOK_ID`**

Retrieves information on a webhook

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| WEBHOOK_ID | ID associated with the webhook | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/webhooks/WEBHOOK_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Webhook](schemas.md#webhook) | Webhook information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if webhook was not found |

<br/>

## PATCH

https://api.losant.com/applications/**`APPLICATION_ID`**/webhooks/**`WEBHOOK_ID`**

Updates information about a webhook

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| WEBHOOK_ID | ID associated with the webhook | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Webhook Patch](schemas.md#webhook-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Webhook",
  "responseCode": 201
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Webhook","responseCode":201}' \
    https://api.losant.com/applications/APPLICATION_ID/webhooks/WEBHOOK_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Webhook](schemas.md#webhook) | Updated webhook information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if webhook was not found |

<br/>

