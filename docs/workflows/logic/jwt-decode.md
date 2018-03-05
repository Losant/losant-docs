flowclass: Cloud
flowclass: Edge 1.0.0
description: Learn more about the Losant JWT: Decode Node.

# JWT: Decode

The JWT: Decode Node allows a workflow to decode a [JSON Web Token](https://jwt.io/) on the payload.

![JWT Decode Node](/images/workflows/logic/jwt-decode-node.png "JWT Decode Node")

## Configuration

The JWT: Decode Node requires a token template and a result path. There is one optional configuration which is a checkbox called `Complete Payload, Headers and Signature`. If this is checked and the JWT successfully decoded, the result will include the JWT's signature, decoded payload and headers.

![JWT Decode Configuration](/images/workflows/logic/jwt-decode-configuration.png "JWT Decode Node Configuration")

Example Result Complete Payload, Headers and Signature turned off:

```json
"jwtPayload": {
  "iss":"issuer.com"
  "scope":"https://www.googleapis.com/auth/cloud-platform"
  "aud":"https://www.googleapis.com/oauth2/v4/token"
  "iat":1509374356
  "exp":1509460756
}
```

Example Result Complete Payload, Headers and Signature turned on:

```json
"jwtPayload": {
  "header": {
    "alg": "RS256",
    "typ": "JWT"
  },
  "payload": {
    "iss":"issuer.com"
    "scope":"https://www.googleapis.com/auth/cloud-platform"
    "aud":"https://www.googleapis.com/oauth2/v4/token"
    "iat":1509374356
    "exp":1509460756
  },
  "signature": "aSinGatuR_e"
}
```

## Outputs

The JWT: Decode Node has one output field. The `Destination Path` field takes a [payload path](/workflows/accessing-payload-data/#payload-paths). If successfully decoded, the JWT decode result will be placed on the payload at this path, otherwise it will be an error object.
