description: A detailed look at the various REST actions supported by the Experience Template resource of the Losant API. Learn more.

# Experience Template Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates/**`EXPERIENCE_TEMPLATE_ID`**

Below are the various requests that can be performed against the
Experience Template resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an experience template

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates/**`EXPERIENCE_TEMPLATE_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceTemplate.*, or experienceTemplate.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_TEMPLATE_ID | ID associated with the experience template | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/templates/EXPERIENCE_TEMPLATE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If experience template was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience template was not found |

<br/>

## Get

Retrieves information on an experience template

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates/**`EXPERIENCE_TEMPLATE_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceTemplate.*, or experienceTemplate.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_TEMPLATE_ID | ID associated with the experience template | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/templates/EXPERIENCE_TEMPLATE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Template](schemas.md#experience-template) | Experience template information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience template was not found |

<br/>

## Patch

Updates information about an experience template

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/experience/templates/**`EXPERIENCE_TEMPLATE_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceTemplate.*, or experienceTemplate.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_TEMPLATE_ID | ID associated with the experience template | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Experience Template Patch](schemas.md#experience-template-patch) schema. For example, the following would be a
valid body for this request:

```json
{
  "body": "New Content! <p>{{newData}}</p>",
  "templateTags": {
    "customKey": "newCustomValue"
  }
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X PATCH \
    -d '{"body":"New Content! <p>{{newData}}</p>","templateTags":{"customKey":"newCustomValue"}}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/templates/EXPERIENCE_TEMPLATE_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Template](schemas.md#experience-template) | Updated experience template information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience template was not found |

<br/>

