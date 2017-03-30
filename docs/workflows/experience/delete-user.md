# Delete Experience User Node

The Delete Experience User node allows a workflow to delete an [Experience User](/experiences/users/) from the current application.

![Delete Experience User Node](/images/workflows/experience/delete-experience-user-node.png "Delete Experience User Node")

## Configuration

The node has two configuration properties - one for finding the user to delete, and one for storing the result of the deletion.

![Delete Experience User Node Config](/images/workflows/experience/delete-experience-user-node-config.png "Delete Experience User Node Config")

For finding the user to delete, the node can find either by user id or email address - which are both required to be unique within the context of the application, and so will at most match a single user. The node determines if it should find by id or email based on the form of the input (since the id and email addresses have different forms). This field is [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a user based on the current workflow payload. The example above is doing exactly that, and is referencing the field `experience.user.id` on the workflow payload.

Optionally, the node also takes a [payload path](/workflows/accessing-payload-data/#payload-paths) to store the result of the user deletion. When a payload path is provided either `true` or `false` will be placed at that path by the node. If node successfully found and deleted a user, `true` will be placed at the payload path, otherwise the value will be `false`. In the example above, this value will be placed at `data.deletionResult`.