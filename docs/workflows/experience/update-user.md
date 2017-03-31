# Update Experience User Node

The Update Experience User node allows a workflow to update an existing [Experience User](/experiences/users/) inside the current application, and optionally add the updated user to the current workflow payload.

![Update Experience User Node](/images/workflows/experience/update-user-node.png "Update Experience User Node")

## Configuration

For finding the user to update, the node can find either by user id or email address - which are both required to be unique within the context of the application, and so will at most match a single user. The node determines if it should find by id or email based on the form of the input (since the id and email addresses have different forms). This field is [templatable](/workflows/accessing-payload-data/#string-templates), and so supports finding a user based on the current workflow payload. The example below is doing exactly that, and is referencing the field `experience.user.id` on the workflow payload.

![Update Experience User Node Configuration](/images/workflows/experience/update-user-node-config.png "Update Experience User Node Configuration")

There are three different ways to configure input data for the create user node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you full control over the user being updated, while the third choice is the more common option for simple situations.

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object that validates against the [Experience User Patch](/rest-api/schemas/#experience-user-patch) schema. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, validates against the [Experience User Patch](/rest-api/schemas/#experience-user-patch) schema.

![Update Experience User Node Individual Fields](/images/workflows/experience/update-user-node-individual-fields.png "Update Experience User Node Individual Fields")

For "Individual Fields", the most common method to use and the one shown in the example above, the user is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). In this case, none of the fields are required - leaving a field blank will just not updated that field on the user. In the example above, the node is just changing the password on user and leaving the other fields alone.

![Update Experience User Node Group Configuration](/images/workflows/experience/update-user-node-group-config.png "Update Experience User Node Group Configuration")

The "Individual Field" configuration continues down into allowing you to modify the group membership of the user being updated. By default, no modification will occur. If the "Edit group membership" checkbox is checked, the selected groups replace the current group membership for the user (selecting no groups in this case will remove the user from all groups). In the example above, we are not choosing to modify the user's groups. In the "Individual Field" case, selecting groups is not templatable - in order to dynamically select groups as part of updating a user, you would need to use the "JSON Template" or "Payload Path" methods of entry.

![Update Experience User Node Tag Configuration](/images/workflows/experience/update-user-node-tag-config.png "Update Experience User Node Tag Configuration")

Finally, the "Individual Field" configuration also allows you to modify user tags. You can add, change, and modify individual tags on the user while leaving other existing tags intact. For removing tags, the configuration just takes a [templatable](/workflows/accessing-payload-data/#string-templates) tag key. In the example above, we are removing the tag `myPasswordFlag` from the user. If the tag key to remove is not found on the user being updated, the removal does nothing. For modifying or adding a tag, the configuration takes both the key and the value (which are both [templatable](/workflows/accessing-payload-data/#string-templates)). If the key already exists on the user, the existing value is modified, otherwise the new key and value are added to the existing user tags. If more detailed control is needed for modifying tags, the "JSON Template" or "Payload Path" methods of entry should be used.

![Update Experience User Node Result](/images/workflows/experience/update-user-node-result.png "Update Experience User Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the created experience user can be placed at that path on the current workflow payload. In the case of a successful user update operation, this will be the updated user object. In the case of a failed user creation this will be an object of the errors that occurred trying to update the user. For instance, given the example node configuration in the screenshots above, this is a possible result for a successful user update:

```json
{
  "experience": {
    ...
    "user": {
      "id": "58dc4ecf9e8df60001fbea0a",
      "userTags": { "myPasswordFlag": "true" },
      ...
    }
  },
  "data": {
    "body": {
      "newPassword": "myNewPassword",
      ...
    },
    "updatedUser": {
      "email": "test@example.com",
      "lastName": "myName",
      "applicationId": "58dc4ec29e8df60001fbea01",
      "creationDate": "2017-03-29T00:15:18.302Z",
      "lastUpdated": "2017-03-30T00:18:23.903Z",
      "userTags": { },
      "passwordLastUpdated": "2017-03-30T00:18:23.903Z",
      "experienceUserId": "58dc4ecf9e8df60001fbea0a",
      "id": "58dc4ecf9e8df60001fbea0a",
      "experienceGroups": []
    },
    ...
  },
  ...
}
```

And again, given the example above, this is a possible result for a failed update, where the new password was not long enough:

```json
{
  "experience": {
    ...
    "user": {
      "id": "58dc4ecf9e8df60001fbea0a",
      "userTags": { "myPasswordFlag": "true" },
      ...
    }
  },
  "data": {
    "body": {
      "newPassword": "short",
      ...
    },
    "updatedUser": {
      "error": {
        "type": "Validation",
        "message": "password has less length than allowed"
      }
    },
    ...
  },
  ...
}
```