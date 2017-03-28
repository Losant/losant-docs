# Experience Group Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups/**`EXPERIENCE_GROUP_ID`**

Below are the various requests that can be performed against the
Experience Group resource, as well as the expected
parameters and the potential responses.

## Delete

Deletes an experience group

#### Method And Url

DELETE https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups/**`EXPERIENCE_GROUP_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceGroup.*, or experienceGroup.delete.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_GROUP_ID | ID associated with the experience group | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/groups/EXPERIENCE_GROUP_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Success](schemas.md#success) | If experience group was successfully deleted |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience group was not found |

<br/>

## Get

Retrieves information on an experience group

#### Method And Url

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups/**`EXPERIENCE_GROUP_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceGroup.*, or experienceGroup.get.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_GROUP_ID | ID associated with the experience group | 575ed78e7ae143cd83dc4aab |

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
    https://api.losant.com/applications/APPLICATION_ID/experience/groups/EXPERIENCE_GROUP_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Group](schemas.md#experience-group) | Experience group information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience group was not found |

<br/>

## Patch

Updates information about an experience group

#### Method And Url

PATCH https://api.losant.com/applications/**`APPLICATION_ID`**/experience/groups/**`EXPERIENCE_GROUP_ID`**

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceGroup.*, or experienceGroup.patch.

#### Request Path Components

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |
| EXPERIENCE_GROUP_ID | ID associated with the experience group | 575ed78e7ae143cd83dc4aab |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Experience Group Patch](schemas.md#experience-group-patch) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Group Name",
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
    -X PATCH \
    -d '{"name":"My New Group Name","experienceUserIds":["575ed70c7ae143cd83dc4aa9","675ed70c7ae143cd83dc4aa9"],"experienceEndpointIds":["58b9d743cbfafe1be675744b","58b9d743cbfafe1be675744c"]}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/groups/EXPERIENCE_GROUP_ID
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Group](schemas.md#experience-group) | Updated experience group information |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if experience group was not found |

<br/>

