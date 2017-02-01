# Audit Log Actions

https://api.losant.com/orgs/**`ORG_ID`**/audit-logs/**`AUDIT_LOG_ID`**

Below are the various requests that can be performed against the
Audit Log resource, as well as the expected
parameters and the potential responses.

## Get

Retrieves information on an audit log

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/audit-logs/**`AUDIT_LOG_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, auditLog.*, or auditLog.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| AUDIT_LOG_ID | ID associated with the audit log | 57955788124b37010084c053 |

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
    https://api.losant.com/orgs/ORG_ID/audit-logs/AUDIT_LOG_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Audit Log](schemas.md#audit-log) | Audit log information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if audit log was not found |

<br/>

