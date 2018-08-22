description: A detailed look at the various REST actions supported by the Experience resource of the Losant API. Learn more.

# Experience Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience

Below are the various requests that can be performed against the
Experience resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes multiple parts of an experience including users, domains, endpoints, groups, views, and workflows

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/experience

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experience.*, or experience.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="delete-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| keepUser | N | Experience Users will automatically be deleted unless this is set. |  | keepUser&#x3D;true |
| keepDomains | N | Experience Domains will automatically be deleted unless this is set. |  | keepDomains&#x3D;true |
| keepEndpoints | N | Experience Endpoints will automatically be deleted unless this is set. |  | keepEndpoints&#x3D;true |
| keepGroups | N | Experience Groups will automatically be deleted unless this is set. |  | keepGroups&#x3D;true |
| keepViews | N | Experience Views will automatically be deleted unless this is set. |  | keepViews&#x3D;true |
| removeWorkflows | N | If set will delete any workflows under this application with an Endpoint Trigger Node. |  | removeWorkflows&#x3D;true |

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
    https://api.losant.com/applications/APPLICATION_ID/experience
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If everything marked as true was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
