# Solution Users Actions

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**/users

Below are the various requests that can be performed against the
Solution Users resource, as well as the expected
parameters and the potential responses.

## Get

Returns the users for the solution

#### Method And Url

GET https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**/users

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.Organization.read, all.User, all.User.read, solutionUsers.*, or solutionUsers.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| ORG_ID | ID associated with the organization | 575ed6e87ae143cd83dc4aa8 |
| SOLUTION_ID | ID associated with the solution | 57955788124b37010084c053 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: email, firstName, lastName, id, creationDate, lastLogin | email | email |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: email, firstName, lastName |  | email |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | email*address |

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
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID/users
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Solution Users](schemas.md#solution-users) | Collection of solution users |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Post

Create a new solution user

#### Method And Url

POST https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**/users

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, solutionUsers.*, or solutionUsers.post.

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
the [Solution User Post](schemas.md#solution-user-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "email": "example@solutionuser.com",
  "firstName": "Example",
  "lastName": "Name",
  "password": "aUserPassword",
  "accessRestrictions": {
    "dashboardIds": [
      "575ece2b7ae143cd83dc4a9b",
      "575ece2b7ae143cd83dc4a9c"
    ]
  }
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"email":"example@solutionuser.com","firstName":"Example","lastName":"Name","password":"aUserPassword","accessRestrictions":{"dashboardIds":["575ece2b7ae143cd83dc4a9b","575ece2b7ae143cd83dc4a9c"]}}' \
    https://api.losant.com/orgs/ORG_ID/solutions/SOLUTION_ID/users
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Solution User](schemas.md#solution-user) | Successfully created solution user |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

