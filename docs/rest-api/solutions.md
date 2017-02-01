# Solutions Actions

https://api.losant.com/orgs/**`ORG_ID`**/solutions

Below are the various requests that can be performed against the
Solutions resource, as well as the expected
parameters and the potential responses.

## Get

Returns the solutions for the organization

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/solutions

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, solutions.*, or solutions.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*solution |

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
    https://api.losant.com/orgs/ORG_ID/solutions
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Solutions](schemas.md#solutions) | Collection of solutions |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Post

Create a new solution

#### Method And Url

POST https://api.losant.com/orgs/**`ORG_ID`**/solutions

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, solutions.*, or solutions.post.

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
the [Solution Post](schemas.md#solution-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Solution",
  "slug": "my_new_solution"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My New Solution","slug":"my_new_solution"}' \
    https://api.losant.com/orgs/ORG_ID/solutions
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Solution](schemas.md#solution) | Successfully created solution |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

