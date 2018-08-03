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