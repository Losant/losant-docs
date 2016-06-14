# Applications Actions

https://api.losant.com/applications

Below are the various requests that can be performed against the
Applications resource, as well as the expected
parameters and the potential responses.

## GET

https://api.losant.com/applications

Returns the applications the current user has permission to see

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, ownerId | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * app |
| orgId | N | If not provided, return all applications. If provided but blank, only return applications belonging to the current user.  If provided and an id, only return applications belonging to the given organization id. |  | 575ecdf07ae143cd83dc4a9a |

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X GET \
    https://api.losant.com/applications
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Applications](schemas.md#applications) | Collection of applications |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## POST

https://api.losant.com/applications

Create a new application

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Application Post](schemas.md#application-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Application",
  "description": "Description of my new application"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"name":"My New Application","description":"Description of my new application"}' \
    https://api.losant.com/applications
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Application](schemas.md#application) | Successfully created application |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

