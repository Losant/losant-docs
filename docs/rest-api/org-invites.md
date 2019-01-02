---
description: A detailed look at the various REST actions supported by the Org Invites resource of the Losant API. Learn more.
---

# Org Invites Actions

https://api.losant.com/invites

Below are the various requests that can be performed against the
Org Invites resource, as well as the expected
parameters and the potential responses.

## Get

Gets information about an invite

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/invites

### Authentication <a name="get-authentication"></a>

No authentication is required for this endpoint.

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| token | Y | The token associated with the invite |  | token&#x3D;aTokenString |
| email | Y | The email associated with the invite |  | email&#x3D;example@example.com |

### Curl Example <a name="get-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X GET \
    https://api.losant.com/invites?token=aTokenString&email=example%40example.com
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitation Information](schemas.md#organization-invitation-information) | Information about invite |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if invite not found |
| 410 | [Error](schemas.md#error) | Error if invite has expired |

## Post

Accepts/Rejects an invite

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/invites

### Authentication <a name="post-authentication"></a>

No authentication is required for this endpoint.

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Organization Invitation Action](schemas.md#organization-invitation-action) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "invitedUser@losant.com",
  "token": "the_invitation_token",
  "accept": true
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"email":"invitedUser@losant.com","token":"the_invitation_token","accept":true}' \
    https://api.losant.com/invites
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitation Result](schemas.md#organization-invitation-result) | Acceptance/Rejection of invite |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if invite not found |
| 410 | [Error](schemas.md#error) | Error if invite has expired |
