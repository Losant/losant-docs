# Audit Logs Actions

https://api.losant.com/orgs/**`ORG_ID`**/audit-logs

Below are the various requests that can be performed against the
Audit Logs resource, as well as the expected
parameters and the potential responses.

## Get

Returns the audit logs for the organization

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/audit-logs

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, auditLogs.*, or auditLogs.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: creationDate, responseStatus, actorName | creationDate | creationDate |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | desc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| start | N | Start of time range for audit log query |  | 1465790400000 |
| end | N | End of time range for audit log query |  | 1465790400000 |
| auditLogFilter | N | Filters for the audit log query. See [Audit Log Filter](schemas.md#audit-log-filter) for more details. |  | [Audit Log Filter Example](schemas.md#audit-log-filter-example) |

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
    https://api.losant.com/orgs/ORG_ID/audit-logs
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Audit Logs](schemas.md#audit-logs) | Collection of audit logs |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if organization was not found |

<br/>

