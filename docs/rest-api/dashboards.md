description: A detailed look at the various REST actions supported by the Dashboards resource of the Losant API. Learn more.

# Dashboards Actions

https://api.losant.com/dashboards

Below are the various requests that can be performed against the
Dashboards resource, as well as the expected
parameters and the potential responses.

## Get

Returns the dashboards the current user has permission to see

#### Method And Url

GET https://api.losant.com/dashboards

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.SolutionUser, all.SolutionUser.read, all.User, dashboards.*, or dashboards.get.

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate, ownerId | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my * dashboard |
| orgId | N | If not provided, return all dashboards. If provided but blank, only return dashboards belonging to the current user. If provided and an id, only return dashboards belonging to the given organization id. |  | 575ece7e7ae143cd83dc4a9c |

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
    https://api.losant.com/dashboards
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Dashboards](schemas.md#dashboards) | Collection of dashboards |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## Post

Create a new dashboard

#### Method And Url

POST https://api.losant.com/dashboards

#### Authentication
A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Organization, all.User, dashboards.*, or dashboards.post.

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Dashboard Post](schemas.md#dashboard-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Dashboard",
  "public": false
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"My New Dashboard","public":false}' \
    https://api.losant.com/dashboards
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Dashboard](schemas.md#dashboard) | Successfully created dashboard |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

