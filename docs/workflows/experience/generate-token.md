flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Generate Experience User Token Node.

# Generate Experience User Token Node

The Generate Experience User Token Node allows a workflow to create a token for an [Experience User](/experiences/users/) that can be used for authorized requests against [Experience Endpoints](/experiences/endpoints/).

![Generate Experience User Token Node](/images/workflows/experience/generate-token-node.png "Generate Experience User Token Node")

## Configuration

There are three configuration settings for the Generate Experience User Token Node - what user to generate the token for, how long the token should eb valid for, and where the token should be placed on the current workflow payload.

![Generate Experience User Token Node Configuration](/images/workflows/experience/generate-token-node-config.png "Generate Experience User Token Node Configuration")

For finding the user to generate the token for, the node can find either by user ID or email address - which are both required to be unique within the context of the application, and so will at most match a single user. The node determines if it should find by ID or email based on the form of the input (since the ID and email addresses have different forms). This field is [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a user based on the current workflow payload. The example above is doing exactly that, and is referencing the field `data.body.userEmail` on the workflow payload.

Optionally, the node also takes value for how long the generated token should be valid for - the "Max Age Template" field. This is another [templatable field](/workflows/accessing-payload-data/#string-templates), and is expected to resolve to a positive number. This number will be treated as the number of milliseconds until the token expires. If no number is provided, the generated token will have no expiration date.

The generated token is then stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) specified in the "Result Path" field. If the user specified in the "ID or Email Template" field was not found, the value stored at this path on the payload will be `null`. Otherwise, it will be the generated token string. In the example above, the token string will be placed at the path `data.generatedToken`.
