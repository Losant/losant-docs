# Org Invites Actions

https://api.losant.com/invites

Below are the various requests that can be performed against the
Org Invites resource, as well as the expected
parameters and the potential responses.

## Get

Gets information about an invite

#### Method And Url

GET https://api.losant.com/invites

#### Authentication
No authentication is required for this endpoint.

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| token | Y | The token associated with the invite |  | aTokenString |
| email | Y | The email associated with the invite |  | example@example.com |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X GET \
    https://api.losant.com/invites?token=aTokenString&email=example%40example.com
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitation Information](schemas.md#organization-invitation-information) | Information about invite |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if invite not found |
| 410 | [Error](schemas.md#error) | Error if invite has expired |

<br/>

## Post

Accepts/Rejects an invite

#### Method And Url

POST https://api.losant.com/invites

#### Authentication
No authentication is required for this endpoint.

#### Request Body

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
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -X POST \
    -d '{"email":"invitedUser@losant.com","token":"the_invitation_token","accept":true}' \
    https://api.losant.com/invites
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitation Result](schemas.md#organization-invitation-result) | Acceptance/Rejection of invite |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if invite not found |
| 410 | [Error](schemas.md#error) | Error if invite has expired |

<br/>

