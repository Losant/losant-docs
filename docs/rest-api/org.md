---
description: A detailed look at the various REST actions supported by the Org resource of the Losant API. Learn more.
---

# Org Actions

https://api.losant.com/orgs/**`ORG_ID`**

Below are the various requests that can be performed against the
Org resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an organization

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/orgs/**`ORG_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

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
    https://api.losant.com/orgs/ORG_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If organization was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

## Get

Retrieves information on an organization

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/orgs/**`ORG_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, org.*, or org.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| summaryExclude | N | Comma seperated list of summary fields to exclude from org summary |  | summaryExclude&#x3D;payloadCount |
| summaryInclude | N | Comma seperated list of summary fields to include in org summary |  | summaryInclude&#x3D;payloadCount |

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
    https://api.losant.com/orgs/ORG_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Organization information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

## Invite Member

Invites a person to an organization

### Method And Url <a name="inviteMember-method-url"></a>

POST https://api.losant.com/orgs/**`ORG_ID`**/invites

### Authentication <a name="inviteMember-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.inviteMember.

### Request Path Components <a name="inviteMember-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Headers <a name="inviteMember-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="inviteMember-body"></a>

The body of the request should be serialized JSON that validates against
the [Organization Invitation Post](schemas.md#organization-invitation-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "email": "invitedUser@losant.com",
  "role": "edit"
}
```

### Curl Example <a name="inviteMember-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"email":"invitedUser@losant.com","role":"edit"}' \
    https://api.losant.com/orgs/ORG_ID/invites
```

### Successful Responses <a name="inviteMember-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitations](schemas.md#organization-invitations) | Invitation information |

### Error Responses <a name="inviteMember-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

## Modify Member

Modifies a current org member&#x27;s role

### Method And Url <a name="modifyMember-method-url"></a>

PATCH https://api.losant.com/orgs/**`ORG_ID`**/member

### Authentication <a name="modifyMember-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.modifyMember.

### Request Path Components <a name="modifyMember-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Headers <a name="modifyMember-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="modifyMember-body"></a>

The body of the request should be serialized JSON that validates against
the [Organization Member Patch](schemas.md#organization-member-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "userId": "575ef90f7ae143cd83dc4aad",
  "role": "view"
}
```

### Curl Example <a name="modifyMember-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"userId":"575ef90f7ae143cd83dc4aad","role":"view"}' \
    https://api.losant.com/orgs/ORG_ID/member
```

### Successful Responses <a name="modifyMember-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Updated organization information |

### Error Responses <a name="modifyMember-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

## Patch

Updates information about an organization

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/orgs/**`ORG_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Organization Patch](schemas.md#organization-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Organization",
  "description": "Description of my updated organization"
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Organization","description":"Description of my updated organization"}' \
    https://api.losant.com/orgs/ORG_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Updated organization information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

## Payload Counts

Returns payload counts for the time range specified for all applications this organization owns

### Method And Url <a name="payloadCounts-method-url"></a>

GET https://api.losant.com/orgs/**`ORG_ID`**/payloadCounts

### Authentication <a name="payloadCounts-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, org.*, or org.payloadCounts.

### Request Path Components <a name="payloadCounts-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Query Parameters <a name="payloadCounts-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| start | N | Start of range for payload count query (ms since epoch) |  | start&#x3D;0 |
| end | N | End of range for payload count query (ms since epoch) |  | end&#x3D;1465790400000 |

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
    https://api.losant.com/orgs/ORG_ID/payloadCounts
```

### Successful Responses <a name="payloadCounts-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Payload Counts](schemas.md#payload-counts) | Payload counts, by type and source |

### Error Responses <a name="payloadCounts-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

## Pending Invites

Gets the current pending invites

### Method And Url <a name="pendingInvites-method-url"></a>

GET https://api.losant.com/orgs/**`ORG_ID`**/invites

### Authentication <a name="pendingInvites-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, org.*, or org.pendingInvites.

### Request Path Components <a name="pendingInvites-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Headers <a name="pendingInvites-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="pendingInvites-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/orgs/ORG_ID/invites
```

### Successful Responses <a name="pendingInvites-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitations](schemas.md#organization-invitations) | Invitation information |

### Error Responses <a name="pendingInvites-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

## Remove Member

Removes a member from the org

### Method And Url <a name="removeMember-method-url"></a>

DELETE https://api.losant.com/orgs/**`ORG_ID`**/member

### Authentication <a name="removeMember-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.removeMember.

### Request Path Components <a name="removeMember-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Query Parameters <a name="removeMember-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| userId | Y | Id of user to remove |  | userId&#x3D;575ed70c7ae143cd83dc4aa9 |

### Request Headers <a name="removeMember-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="removeMember-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/orgs/ORG_ID/member?userId=575ed70c7ae143cd83dc4aa9
```

### Successful Responses <a name="removeMember-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization](schemas.md#organization) | Updated organization information |

### Error Responses <a name="removeMember-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

## Revoke Invite

Revokes an existing invite

### Method And Url <a name="revokeInvite-method-url"></a>

DELETE https://api.losant.com/orgs/**`ORG_ID`**/invites

### Authentication <a name="revokeInvite-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.revokeInvite.

### Request Path Components <a name="revokeInvite-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Query Parameters <a name="revokeInvite-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| inviteId | Y | Id of invite to revoke |  | inviteId&#x3D;575ed71e7ae143cd83dc4aaa |

### Request Headers <a name="revokeInvite-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="revokeInvite-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X DELETE \
    https://api.losant.com/orgs/ORG_ID/invites?inviteId=575ed71e7ae143cd83dc4aaa
```

### Successful Responses <a name="revokeInvite-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organization Invitations](schemas.md#organization-invitations) | Invitation information |

### Error Responses <a name="revokeInvite-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization not found |

## Transfer Resources

Moves resources to a new owner

### Method And Url <a name="transferResources-method-url"></a>

PATCH https://api.losant.com/orgs/**`ORG_ID`**/transferResources

### Authentication <a name="transferResources-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, org.*, or org.transferResources.

### Request Path Components <a name="transferResources-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

### Request Headers <a name="transferResources-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="transferResources-body"></a>

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

### Curl Example <a name="transferResources-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"destinationId":"575ed6e87ae143cd83dc4aa8","destinationType":"organization","applicationIds":["575ec8687ae143cd83dc4a97"]}' \
    https://api.losant.com/orgs/ORG_ID/transferResources
```

### Successful Responses <a name="transferResources-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If resource transfer was successful |

### Error Responses <a name="transferResources-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |
