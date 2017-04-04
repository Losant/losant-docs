# Solution Actions

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

Below are the various requests that can be performed against the
Solution resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes a solution

#### Method And Url

DELETE https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, solution.*, or solution.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

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
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If solution was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if solution was not found |

<br/>

## Get

Retrieves information on a solution

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, solution.*, or solution.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

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
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Solution](schemas.md#solution) | Solution information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if solution was not found |

<br/>

## Patch

Updates information about a solution

#### Method And Url

PATCH https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, solution.*, or solution.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Solution Patch](schemas.md#solution-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Updated Solution",
  "allowSelfDeletion": true
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"name":"My Updated Solution","allowSelfDeletion":true}' \
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Solution](schemas.md#solution) | Updated solution information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if solution was not found |

<br/>

