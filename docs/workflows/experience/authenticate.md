flowclass: Cloud
description: Learn more about the Losant Authenticate Experience User Node.

# Authenticate Experience User Node

The Authenticate Experience User Node allows a workflow to authenticate an email and password against [Experience Users](/experiences/users/) in the application. It can also optionally generate a token that can subsequently be used for authorized requests against [Experience Endpoints](/experiences/endpoints/).

![Authenticate Experience User Node](/images/workflows/experience/authenticate-node.png "Authenticate Experience User Node")

## Configuration

The Authenticate Experience User Node has two sections. First, a required section for configuring the credentials to check against existing Experience Users, and then second an optional section about what do do with the result of a successful authentication.

![Authenticate Experience User Node Config](/images/workflows/experience/authenticate-node-config.png "Authenticate Experience User Node Config")

The credentials to check are two [templatable](/workflows/accessing-payload-data/#string-templates) fields, one for email and one for password. In the example above, they are templates that will pull in the values from the `data.body.email` and `data.body.password` fields, respectively, from the current workflow payload.

The given email is used to find an existing Experience User in the application, at which point (if one is found), the given password is then hashed and checked against the stored password hash for the found Experience User. If the password hash matches, this is a successful authentication, and the `true` (or right) path out of the node is taken. If no user is found or the password does not match, the `false` (or left) path out of the node is taken.

![Authenticate Experience User Node Output](/images/workflows/experience/authenticate-node-output.png "Authenticate Experience User Node Output")

If authentication is successful, the result configuration section comes into play. The "User Result Path" is a [payload path](/workflows/accessing-payload-data/#payload-paths) field, and if a path is provided, the successfully authenticated user will be placed at that spot on the payload. The "Token Result Path" is another [payload path](/workflows/accessing-payload-data/#payload-paths) field, and if a path is provided, an authorization [token](/workflows/experience/generate-token/) will be generated and placed at that path (which can be used to authorize subsequent [Experience Endpoints](/experiences/endpoints/) requests). The "Max Age Template" only matters if a "Token Result Path" is provided (and a token is being generated). It is a [templatable field](/workflows/accessing-payload-data/#string-templates) which is expected to resolve to a positive number. This number will be treated as the number of milliseconds until the generated token expires. If no number is provided, the generated token will have no expiration date.
