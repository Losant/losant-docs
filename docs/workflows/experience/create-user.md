flowclass: Cloud
flowclass: Experience
description: Learn more about the Losant Create Experience User Node.

# Create Experience User Node

The Create Experience User Node allows a workflow to create a new [Experience User](/experiences/users/) inside the current application, and optionally add the new user to the current workflow payload.

![Create Experience User Node](/images/workflows/experience/create-user-node.png "Create Experience User Node")

## Configuration

There are three different ways to configure input data for the Create Experience User Node - "JSON Template", "Payload Path", and "Individual Fields". The first two are more complicated to use, but are very powerful because they give you full control over the user being created, while the third choice is the more common option for simple situations.

![Create Experience User Node Configuration](/images/workflows/experience/create-user-node-config.png "Create Experience User Node Configuration")

For "JSON Template", the input must be a [JSON template string](/workflows/accessing-payload-data/#json-templates) that can be parsed into a JSON object that validates against the [Experience User Post](/rest-api/schemas/#experience-user-post) schema. For "Payload Path", the input must be a [payload path](/workflows/accessing-payload-data/#payload-paths) that points to an object on the current workflow payload that, again, validates against the [Experience User Post](/rest-api/schemas/#experience-user-post) schema.

For "Individual Fields", the most common method to use and the one shown in the example above, the user is broken into multiple fields that can be filled in using individual [string templates](/workflows/accessing-payload-data/#string-templates). In this case, email and password are required, first and last name are optional (same as when creating an [Experience User](/experiences/users/) normally).

![Create Experience User Node More Configuration](/images/workflows/experience/create-user-node-more-config.png "Create Experience User Node More Configuration")

The "Individual Field" configuration continues down into allowing you to select groups for this new user to become a part of. In the example above, we are not choosing to add this new user to any groups. In the "Individual Field" case, selecting groups is not templatable - in order to dynamically select groups as part of user creation, you would need to use the "JSON Template" or "Payload Path" methods of entry.

Finally, the "Individual Field" configuration also allows you to set user tags, following the same rules as when creating an [Experience User](/experiences/users/) normally. In the example above, one tag will be added to this new user - a tag with the key `externalId` and the value brought in as a [string templates](/workflows/accessing-payload-data/#string-templates) (both the keys and values here are templatable).

![Create Experience User Node Result](/images/workflows/experience/create-user-node-result.png "Create Experience User Node Result")

Optionally you can provide a payload path in the "Result Path" field so that the created experience user can be placed at that path on the current workflow payload. In the case of a successful user creation, this will be the user object, and in the case of a failed user creation this will be an object of any errors about the creation of the user. For instance, given the example node configuration in the screenshots above, this is a possible result for a successful user creation:

```json
{
  "data": {
    "body": {
      "systemId": "myExternalSystemId",
      "newUser": {
        "email": "test@example.com",
        "password": "myFakePassword",
        "name": "myName"
      }
      ...
    },
    "createdUser": {
      "email": "test@example.com",
      "lastName": "myName",
      "applicationId": "58dc4ec29e8df60001fbea01",
      "creationDate": "2017-03-30T00:18:23.902Z",
      "lastUpdated": "2017-03-30T00:18:23.902Z",
      "userTags": {
        "externalId": "myExternalSystemId"
      },
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

And again, given the example above, this is a possible result for a failed creation, where the email address was already in use for an existing experience user:

```json
{
  "data": {
    "body": {
      "systemId": "myExternalSystemId",
      "newUser": {
        "email": "test@example.com",
        "password": "myFakePassword",
        "name": "myName"
      }
      ...
    },
    "createdUser": {
      "error": {
        "type": "AlreadyExists",
        "message": "Email address \"test@example.com\" already exists"
      }
    },
    ...
  },
  ...
}
```
