description: A detailed look at the various REST actions supported by the Solution resource of the Losant API. Learn more.

# Solution Actions

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

Below are the various requests that can be performed against the
Solution resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a solution

### Method And Url <a name="delete-method-url"></a>

DELETE https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

### Authentication <a name="delete-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, solution.*, or solution.delete.

### Request Path Components <a name="delete-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

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
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID
```

### Successful Responses <a name="delete-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If solution was successfully deleted |

### Error Responses <a name="delete-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if solution was not found |

## Get

Retrieves information on a solution

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, solution.*, or solution.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

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
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Solution](schemas.md#solution) | Solution information |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if solution was not found |

## Patch

Updates information about a solution

### Method And Url <a name="patch-method-url"></a>

PATCH https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

### Authentication <a name="patch-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, solution.*, or solution.patch.

### Request Path Components <a name="patch-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

### Request Headers <a name="patch-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="patch-body"></a>

The body of the request should be serialized JSON that validates against
the [Solution Patch](schemas.md#solution-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Solution",
  "allowSelfDeletion": true
}
```

### Curl Example <a name="patch-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Solution","allowSelfDeletion":true}' \
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID
```

### Successful Responses <a name="patch-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Solution](schemas.md#solution) | Updated solution information |

### Error Responses <a name="patch-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if solution was not found |
