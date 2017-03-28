# Experience Groups Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups

Below are the various requests that can be performed against the
Experience Groups resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience groups for an application

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceGroups.*, or experienceGroups.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*group |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/groups
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Groups](schemas.md#experience-groups) | Collection of experience groups |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new experience group for an application

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceGroups.*, or experienceGroups.post.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Experience Group Post](schemas.md#experience-group-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My Group",
  "experienceUserIds": [
    "575ed70c7ae143cd83dc4aa9",
    "675ed70c7ae143cd83dc4aa9"
  ],
  "experienceEndpointIds": [
    "58b9d743cbfafe1be675744b",
    "58b9d743cbfafe1be675744c"
  ]
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My Group","experienceUserIds":["575ed70c7ae143cd83dc4aa9","675ed70c7ae143cd83dc4aa9"],"experienceEndpointIds":["58b9d743cbfafe1be675744b","58b9d743cbfafe1be675744c"]}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/groups
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience Group](schemas.md#experience-group) | Successfully created experience group |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

