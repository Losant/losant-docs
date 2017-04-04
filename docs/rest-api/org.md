# Org Actions

https://api.losant.com/orgs/**`ORG_ID`**

Below are the various requests that can be performed against the
Org resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an organization

#### Method And Url

DELETE https://api.losant.com/orgs/**`ORG_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/orgs/ORG_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If organization was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

<br/>

## Get

Retrieves information on an organization

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, org.*, or org.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| summaryExclude | N | List of summary fields to exclude from org summary |  | payloadCount |

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
    https://api.losant.com/orgs/ORG_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

<br/>

## Invite Member

Invites a person to an organization

#### Method And Url

POST https://api.losant.com/orgs/**`ORG_ID`**/invites

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.inviteMember.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Organization Invitation Post](schemas.md#organization-invitation-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "invitedUser@losant.com",
  "role": "edit"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"email":"invitedUser@losant.com","role":"edit"}' \
    https://api.losant.com/orgs/ORG_ID/invites
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitations](schemas.md#organization-invitations) | Invitation information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

<br/>

## Modify Member

Modifies a current org member&#x27;s role

#### Method And Url

PATCH https://api.losant.com/orgs/**`ORG_ID`**/member

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.modifyMember.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Organization Member Patch](schemas.md#organization-member-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "userId": "575ef90f7ae143cd83dc4aad",
  "role": "view"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"userId":"575ef90f7ae143cd83dc4aad","role":"view"}' \
    https://api.losant.com/orgs/ORG_ID/member
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Updated organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

<br/>

## Patch

Updates information about an organization

#### Method And Url

PATCH https://api.losant.com/orgs/**`ORG_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Organization Patch](schemas.md#organization-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Organization",
  "description": "Description of my updated organization"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Organization","description":"Description of my updated organization"}' \
    https://api.losant.com/orgs/ORG_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Updated organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

<br/>

## Payload Counts

Returns payload counts for the time range specified for all applications this organization owns

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/payloadCounts

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, org.*, or org.payloadCounts.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start of range for payload count query (ms since epoch) |  | 0 |
| end | N | End of range for payload count query (ms since epoch) |  | 1465790400000 |

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
    https://api.losant.com/orgs/ORG_ID/payloadCounts
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Counts](schemas.md#payload-counts) | Payload counts, by type and source |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

<br/>

## Pending Invites

Gets the current pending invites

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/invites

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, org.*, or org.pendingInvites.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

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
    https://api.losant.com/orgs/ORG_ID/invites
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitations](schemas.md#organization-invitations) | Invitation information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

<br/>

## Remove Member

Removes a member from the org

#### Method And Url

DELETE https://api.losant.com/orgs/**`ORG_ID`**/member

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.removeMember.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| userId | Y | Id of user to remove |  | 575ed70c7ae143cd83dc4aa9 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/orgs/ORG_ID/member?userId=575ed70c7ae143cd83dc4aa9
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Updated organization information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

<br/>

## Revoke Invite

Revokes an existing invite

#### Method And Url

DELETE https://api.losant.com/orgs/**`ORG_ID`**/invites

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.revokeInvite.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| inviteId | Y | Id of invite to revoke |  | 575ed71e7ae143cd83dc4aaa |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/orgs/ORG_ID/invites?inviteId=575ed71e7ae143cd83dc4aaa
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitations](schemas.md#organization-invitations) | Invitation information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

<br/>

## Transfer Resources

Moves resources to a new owner

#### Method And Url

PATCH https://api.losant.com/orgs/**`ORG_ID`**/transferResources

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.transferResources.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Resource Transfer](schemas.md#resource-transfer) schema. For example, the following would be a
valid body for this request:

```json
{
  "destinationId": "575ed6e87ae143cd83dc4aa8",
  "destinationType": "organization",
  "applicationIds": [
    "575ec8687ae143cd83dc4a97"
  ]
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"destinationId":"575ed6e87ae143cd83dc4aa8","destinationType":"organization","applicationIds":["575ec8687ae143cd83dc4a97"]}' \
    https://api.losant.com/orgs/ORG_ID/transferResources
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If resource transfer was successful |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

<br/>

