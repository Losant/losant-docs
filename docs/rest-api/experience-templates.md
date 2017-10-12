description: A detailed look at the various REST actions supported by the Experience Templates resource of the Losant API. Learn more.

# Experience Templates Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates

Below are the various requests that can be performed against the
Experience Templates resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience templates for an application

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceTemplates.*, or experienceTemplates.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: id, creationDate, name | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*template |
| templateType | N | Filter templates to those only of the given type. Accepted values are: page, layout, component |  | page |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/templates
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Templates](schemas.md#experience-templates) | Collection of experience templates |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

## Post

Create a new experience template for an application

#### Method And Url

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceTemplates.*, or experienceTemplates.post.

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
the [Experience Template Post](schemas.md#experience-template-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My Page Template",
  "templateType": "page",
  "body": "<p>{{data}}</p>",
  "layoutId": "59cc5cad8246c6caed4b16c2",
  "templateTags": {
    "customKey": "customValue"
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
    -d '{"name":"My Page Template","templateType":"page","body":"<p>{{data}}</p>","layoutId":"59cc5cad8246c6caed4b16c2","templateTags":{"customKey":"customValue"}}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/templates
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience Template](schemas.md#experience-template) | Successfully created experience template |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<br/>

