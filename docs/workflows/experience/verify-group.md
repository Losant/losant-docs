flowclass: Cloud
description: Learn more about the Losant Verify Group Experience Membership Node.

# Verify Group Experience Membership Node

The Verify Group Experience Membership Node allows a workflow to verify that a user is a member of an [Experience Group](/experiences/groups/) in the application.

![Verify Group Experience Membership Node](/images/workflows/experience/verify-group-node.png "Verify Group Experience Membership Node")

## Configuration

The Verify Group for Experience User Node has two required fields. First, Experience User's ID or email, and then second a dropdown of existing Experience Groups.

![Verify Group Experience Membership Node Config](/images/workflows/experience/verify-group-node-config.png "Verify Group Experience Membership Node Config")

The User credential to check is [templatable](/workflows/accessing-payload-data/#string-templates) field, for email or ID.

The given email is used to find an existing Experience User in the application, at which point (if one is found), a selected Experience Group is checked for that user's membership. If the user is a member of the group, this is a successful verification, and the `true` (or right) path out of the node is taken. If no user is found or the user is not a memeber of the group, the `false` (or left) path out of the node is taken.
