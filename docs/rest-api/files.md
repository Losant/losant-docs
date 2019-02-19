---
description: A detailed look at the various REST actions supported by the Files resource of the Losant API. Learn more.
---

# Files Actions

https://api.losant.com/applications/**`APPLICATION_ID`**/files

Below are the various requests that can be performed against the
Files resource, as well as the expected
parameters and the potential responses.

## Get

Returns the files for an application

### Method And Url <a name="get-method-url"></a>

GET https://api.losant.com/applications/**`APPLICATION_ID`**/files

### Authentication <a name="get-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Application.read, all.Organization, all.Organization.read, all.User, all.User.read, files.*, or files.get.

### Request Path Components <a name="get-path-components"></a>

| Path Component | Description | Example |
| -------------- | ----------- | ------- |
| APPLICATION_ID | ID associated with the application | 575ec8687ae143cd83dc4a97 |

### Request Query Parameters <a name="get-query-params"></a>

| Name | Required | Description | Default | Example |
| ---- | -------- | ----------- | ------- | ------- |
| sortField | N | Field to sort the results by. Accepted values are: lastUpdated, type, name, creationDate | lastUpdated | sortField&#x3D;subject |
| sortDirection | N | Direction to sort the results by. Accepted values are: asc, desc | asc | sortDirection&#x3D;asc |
| page | N | Which page of results to return | 0 | page&#x3D;0 |
| perPage | N | How many items to return per page | 1000 | perPage&#x3D;10 |
| filterField | N | Field to filter the results by. Blank or not provided means no filtering. Accepted values are: name |  | filterField&#x3D;name |
| filter | N | Filter to apply against the filtered field. Supports globbing. Blank or not provided means no filtering. |  | filter&#x3D;myFile |
| type | N | Limit by the type (file or directory) of the file |  | type&#x3D;file |
| status | N | Limit the result to only files of this status. Accepted values are: completed, pending |  | status&#x3D;completed |
| directory | N | Get files that are inside of this directory |  | directory&#x3D;/a/path/ |

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
    https://api.losant.com/applications/APPLICATION_ID/files
```

### Successful Responses <a name="get-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 200 | [Files Schema](schemas.md#files-schema) | Collection of files |

### Error Responses <a name="get-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

## Post

Create a new file for an application

### Method And Url <a name="post-method-url"></a>

POST https://api.losant.com/applications/**`APPLICATION_ID`**/files

### Authentication <a name="post-authentication"></a>

A valid api access token is required to access this endpoint. The token must
include at least one of the following scopes:
all.Application, all.Organization, all.User, files.*, or files.post.

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
the [File Post](schemas.md#file-post) schema. For example, the following would be a
valid body for this request:

```json
{
  "name": "file.csv",
  "type": "file",
  "parentDirectory": "/",
  "fileSize": 500,
  "contentType": "text/csv"
}
```

### Curl Example <a name="post-curl-example"></a>

```bash
curl -H 'Content-Type: application/json' \
    -H 'Accept: application/json' \
    -H 'Authorization: Bearer YOUR_API_ACCESS_TOKEN' \
    -X POST \
    -d '{"name":"file.csv","type":"file","parentDirectory":"/","fileSize":500,"contentType":"text/csv"}' \
    https://api.losant.com/applications/APPLICATION_ID/files
```

### Successful Responses <a name="post-successful-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 201 | [File Upload Post Response](schemas.md#file-upload-post-response) | Successfully created file and returned a post url to respond with |

### Error Responses <a name="post-error-responses"></a>

| Code | Type | Description |
| ---- | ---- | ----------- |
| 400 | [Error](schemas.md#error) | Error if malformed request |
| 404 | [Error](schemas.md#error) | Error if application was not found |

<!-- markdownlint-disable MD002 -->

### Usage of Response

After making a `Files` POST to Losant with the information *about* your file, you will need to make a second request, using the information in the `upload` field of the [file post response](schemas.md#file-post-response), to perform the actual upload of your file. For example, below is how to use curl and the file post response to perform the upload of the file data:

```bash
curl -X POST \
  -F 'Content-Type=<YOUR_POST_RESPONSE.upload.fields.Content-Type>' \
  -F 'key=<YOUR_POST_RESPONSE.upload.fields.key>' \
  -F 'X-Amz-Algorithm=<YOUR_POST_RESPONSE.upload.fields.X-Amz-Algorithm>' \
  -F 'X-Amz-Credential=<YOUR_POST_RESPONSE.upload.fields.X-Amz-Credential>' \
  -F 'X-Amz-Date=<YOUR_POST_RESPONSE.upload.fields.X-Amz-Date>' \
  -F 'Policy=<YOUR_POST_RESPONSE.upload.fields.Policy>' \
  -F 'X-Amz-Signature=<YOUR_POST_RESPONSE.upload.fields.X-Amz-Signature>' \
  -F 'file=@<YOUR_LOCAL_FILE_PATH>' \
  '<YOUR_POST_RESPONSE.upload.url>'
```

As another example, here is how you would upload the file contents using Javascript in a browser:

```javascript
var filePostResponse = /* result of Losant API Files POST call */;
var fileBlob = /* a blob, buffer, or browser file instance */;

var formData = new FormData();
formData.append('Content-Type',
  filePostResponse.upload.fields['Content-Type']);
formData.append('key', filePostResponse.upload.fields.key);
formData.append('X-Amz-Algorithm',
  filePostResponse.upload.fields['X-Amz-Algorithm']);
formData.append('X-Amz-Credential',
  filePostResponse.upload.fields['X-Amz-Credential']);
formData.append('X-Amz-Date',
  filePostResponse.upload.fields['X-Amz-Date']);
formData.append('Policy', filePostResponse.upload.fields['Policy']);
formData.append('X-Amz-Signature',
  filePostResponse.upload.fields['X-Amz-Signature']);
formData.append('file', fileBlob);

var xhr = new XMLHttpRequest();
xhr.open('POST', filePostResponse.upload.url, true);
xhr.send(formData);
```