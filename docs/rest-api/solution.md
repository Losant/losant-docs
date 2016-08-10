# Solution Actions

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

Below are the various requests that can be performed against the
Solution resource, as well as the expected
parameters and the potential responses.

## DELETE

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

Deletes a solution

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## GET

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

Retrieves information on a solution

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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

## PATCH

https://api.losant.com/orgs/**`ORG_ID`**/solutions/**`SOLUTION_ID`**

Updates information about a solution

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
the [Solution Patch](schemas.md#solution-patch) schema.  For example, the following would be a
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
    -H 'Authorization: Bearer YOUR_AUTH_TOKEN' \
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

