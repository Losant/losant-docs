---
description: A detailed look at the various REST actions supported by the Experience Domains resource of the Losant API. Learn more.
---

# Experience Domains Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/domains

Below are the various requests that can be performed against the
Experience Domains resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience domains for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/domains

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceDomains.*, or experienceDomains.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="get-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Curl Example <a name="get-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X GET \
    https://api.losant.com/applications/APPLICATION_ID/experience/domains
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Domains](schemas.md#experience-domains) | Collection of experience domains |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new experience domain for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/domains

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceDomains.*, or experienceDomains.post.

### Request Path Components <a name="post-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Headers <a name="post-headers"></a>

| Name | Required | Description | Default |
| ---- | -------- | ----------- | ------- |
| Authorization | Y | The token for authenticating the request, prepended with Bearer | |

### Request Body <a name="post-body"></a>

The body of the request should be serialized JSON that validates against
the [Experience Domain Post](schemas.md#experience-domain-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "domainName": "my.example.domain.com",
  "sslCert": "MY_SSL_CERTIFICATE",
  "sslKey": "MY_SSL_KEY",
  "version": "develop"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"domainName":"my.example.domain.com","sslCert":"MY_SSL_CERTIFICATE","sslKey":"MY_SSL_KEY","version":"develop"}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/domains
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience Domain](schemas.md#experience-domain) | Successfully created experience domain |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
