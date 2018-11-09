description: A detailed look at the various REST actions supported by the Experience resource of the Losant API. Learn more.

# Experience Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience

Below are the various requests that can be performed against the
Experience resource, as well as the expected
parameters and the potential responses.

## Bootstrap

Bootstraps the experience for this application with standard endpoints and views

### Method And Url <a name="bootstrap-method-url"></a>

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/experience/bootstrap

### Authentication <a name="bootstrap-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experience.*, or experience.bootstrap.

### Request Path Components <a name="bootstrap-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="bootstrap-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="bootstrap-body"></a>

The body of the request should be serialized JSON that validates against
the [Experience Bootstrap Options](schemas.md#experience-bootstrap-options) schema. For example, the following would be a
valid body for this request:

```json
{
  "replaceExisting": true
}
```

### Curl Example <a name="bootstrap-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"replaceExisting":true}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/bootstrap
```

### Successful Responses <a name="bootstrap-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Bootstrap Result](schemas.md#experience-bootstrap-result) | If bootstrap was successful |

### Error Responses <a name="bootstrap-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Delete

Deletes multiple parts of an experience including users, groups, slugs, domains, versions, endpoints, views, and workflows

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
| keepUsers | N | If this is set, Experience Users will not be removed. |  | keepUsers&#x3D;true |
| keepGroups | N | If this is set, Experience Groups will not be removed. |  | keepGroups&#x3D;true |
| keepSlugs | N | If this is set, Experience Slugs will not be removed. |  | keepSlugs&#x3D;true |
| keepDomains | N | If this is set, Experience Domains will not be removed. |  | keepDomains&#x3D;true |
| removeVersions | N | If this is set, all Experience Versions and their contents will be removed (except for develop). |  | removeVersions&#x3D;true |
| keepViews | N | If this is set, Experience Views (in the develop version) will not be removed. |  | keepViews&#x3D;true |
| keepEndpoints | N | If this is set, Experience Endpoints (in the develop version) will not be removed. |  | keepEndpoints&#x3D;true |
| removeWorkflows | N | If this is set, all Experience Workflows (in the develop version) will ve removed. |  | removeWorkflows&#x3D;true |

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
| 200 | [Success](schemas.md#success) | If deletion was successful |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
