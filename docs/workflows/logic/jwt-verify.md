flowclass: Cloud
flowclass: Experience
flowclass: Edge 1.0.0
description: Learn more about the Losant JWT: Verify Node.

# JWT: Verify

The JWT: Verify Node allows a workflow to verify that a [JSON Web Token](https://jwt.io/) on the payload is valid. This node will branch based upon the conditional output, like the [Conditional Node](/workflows/accessing-payload-data/#conditional).

![JWT Verify Node](/images/workflows/logic/jwt-verify-node.png "JWT Verify Node")

## Configuration

The JWT Verify Node requires two fields, the `Token Template` and the `Secret Template`. The `Token Template` is the JSON Web Token to be verified. The `Secret Template` is the secret key used to sign the JWT when created. If the JWT is valid, the payload will be pushed down the right side output, if it is not valid it will travel down the left. There are two optional input fields. One is the `Issuer Template` which validates the issuer against the token. The second is the `Error Path`. The `Error Path` field takes a [payload path](/workflows/accessing-payload-data/#payload-paths), and if the JWT is not valid an error will be placed at this path on the payload.

![JWT Verify Node Config](/images/workflows/logic/jwt-verify-node-config.png "JWT Verify Node Config")
