# Losant REST API

Losant is powered by a full REST API that provides access to nearly every feature. The Losant web portal is built on top of the open-source <a href="https://github.com/GetStructure/losant-api-js" target="_blank">losant-api-js</a> Node.js client. This is the recommended client to easily communicate with the Losant API.

## Obtaining API Token

In order to make API requests, you must first obtain an API token. You can generate either an account-level token or a device-level token, depending on your specific application needs. Once obtained, the token should then be provided in the `Authorization` header for all subsequent REST calls (e.g. `"AUTHORIZATION": "Bearer your-api-token"`).

### Account-Level Token

An account level token provide access to all resources owned by the user account.

`POST: https://api.losant.com/auth/user`

Payload:

```json
{
  "email" : "your-email",
  "password" : "your-password"
}
```

Response:

```json
{
  ...
  "token" : "your-api-token"
}
```

The response will include several fields, including your API token.

### Device-Level Token

A device level token will only allow access to resources for a specific device. In order to generate a device-level API token, you must first generate an application [access key](/applications/access-keys).

`POST: https://api.losant.com/auth/device`

Payload:

```json
{
  "deviceId" : "your-device-id",
  "key" : "your-access-key",
  "secret" : "your-access-secret"
}
```

Response:

```json
{
  ...
  "token" : "your-api-token"
}
```

The response will include several fields, including your API token.

## Publish State

Publishing [device state](/devices/state/) is likely one of the most common actions a user will perform with the REST API.

`POST: https://api.losant.com/applications/:applicationId/devices/:deviceId/state`

Payload:

```json
{
  "data" : {
    <attribute-name> : <attribute-value>,
    <attribute-name> : <attribute-value>
    ...
  }
}
```

For example, if you have a sensor that measures temperature and humidity, the payload would look something like this:

```json
{
  "data" : {
    "temperature" : 72,
    "humidity" : 0.84
  }
}
```

## JavaScript API Client

Once a token is obtained you can construct a client, pass it the token, and begin using the API.

```JavaScript
var api = require('losant-api-js');

var client = api.createClient({
  accessToken: 'my-token'
});
```

## Documentation

Full documentation is not yet available. Please refer to the <a href="https://github.com/GetStructure/losant-api-js" target="_blank">Node.js client repository</a> for usage details.
