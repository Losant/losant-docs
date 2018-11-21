flowclass: Application
flowclass: Experience
description: Learn more about the Losant Verify Experience Group Membership Node.

# Verify Experience Group Membership Node

The Verify Experience Group Membership Node allows a workflow to verify that an [Experience User](/experiences/users/) is a member of an [Experience Group](/experiences/groups/) in the application.

![Verify Experience Group Membership Node](/images/workflows/experience/verify-group-node.png "Verify Experience Group Membership Node")

## Configuration

The node has two required fields. First, an Experience User's ID or email, and then second the Experience Group to verify membership against.

![Verify Experience Group Membership Node Config](/images/workflows/experience/verify-group-node-config.png "Verify Experience Group Membership Node Config")

The ID or email field is [templatable](/workflows/accessing-payload-data/#string-templates), allowing you to pull a value off the current payload. The given user identifier is used to find an existing Experience User in the application, at which point (if one is found), the selected Experience Group is checked for that user's membership. If the user is a member of the group, this is a successful verification, and the `true` (or right) path out of the node is taken. If no user is found or the user is not a member of the group, the `false` (or left) path out of the node is taken.
