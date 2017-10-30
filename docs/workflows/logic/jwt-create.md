# JWT Create

The JWT Create node allows a workflow to create a [JSON Web Token](https://jwt.io/) from a json object and secret and places it on the payload.

![JWT Create Node](/images/workflows/logic/jwt-create-node.png "JWT Create Node")

## Configuration

JWT Create node configuration requires at least a `JSON Template` object, `Secret Template` and an `Algorithm Type`. The JSON template can be given as a path from the payload or a JSON template object, both should resolve to an object. The secret template can either be a payload template path, or the secret key itself. The default alogithm type is `HS256`, see the list below for all algorithms.

![JWT Create Node Config](/images/workflows/logic/jwt-create-node-config.png "JWT Create Node Config")

## Algorithm Types
* HS256 - default
* HS384
* HS512
* RS256
* RS384
* RS512
* ES256
* ES384
* ES512


## Outputs

The JWT create node has one optional output field. The `Destination Path` field takes a [payload path](/workflows/accessing-payload-data/#payload-paths). If it is defined and the JWT successfully created, it will be added to your payload at said path, otherwise an error object will be there.

## Options

If any of these options are given in the `JSON Template` field, they will **not** be overwritten by these options. These options are your defaults.

* `Expires In` - Given a number and the time unit to create an expiration date. This will not be used if `exp` exists in the `JSON Template`.

* `Issuer Template` - A string or payload template that will used as the issuser. This will not be used if `iss` exists in the `JSON Template`.

![JWT Create Node Options](/images/workflows/logic/jwt-create-node-options.png "JWT Create Node Options")

