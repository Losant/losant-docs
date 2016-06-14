# Orgs Actions

https://api.losant.com/orgs

Below are the various requests that can be performed against the
Orgs resource, as well as the expected
parameters and the potential responses.

## GET

https://api.losant.com/orgs

Returns the organizations associated with the current user

#### Request Query Parameters

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: name, id, creationDate | name | name |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | asc |
| page | N | Which page of results to return | 0 | 0 |
| perPage | N | How many items to return per page | 1000 | 10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | my*org |

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
    https://api.losant.com/orgs
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Organizations](schemas.md#organizations) | Collection of organizations |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

## POST

https://api.losant.com/orgs

Create a new organization

#### Request Headers

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

#### Request Body

The body of the request should be serialized JSON that validates against
the [Organization Post](schemas.md#organization-post) schema.  For example, the following would be a
valid body for this request:

```json
{
  "name": "My New Organization",
  "description": "Description of my new organization"
}
```
<small><br/></small>

#### Curl Example

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
    -X POST \
    -d '{"name":"My New Organization","description":"Description of my new organization"}' \
    https://api.losant.com/orgs
```
<br/>

#### Successful Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Organization](schemas.md#organization) | Successfully created organization |

#### Error Responses

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |

<br/>

