description: A detailed look at the various REST actions supported by the Experience Slugs resource of the Losant API. Learn more.

# Experience Slugs Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/experience/slugs

Below are the various requests that can be performed against the
Experience Slugs resource, as well as the expected
parameters and the potential responses.

## Get

Returns the experience slugs for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/experience/slugs

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, experienceSlugs.*, or experienceSlugs.get.

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
    https://api.losant.com/applications/APPLICATION_ID/experience/slugs
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Experience Slugs](schemas.md#experience-slugs) | Collection of experience slugs |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new experience slug for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/experience/slugs

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, experienceSlugs.*, or experienceSlugs.post.

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
the [Experience Slug Post](schemas.md#experience-slug-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "slug": "my-custom-slug",
  "version": "develop"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"slug":"my-custom-slug","version":"develop"}' \
    https://api.losant.com/applications/APPLICATION_ID/experience/slugs
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [Experience Slug](schemas.md#experience-slug) | Successfully created experience slug |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |
