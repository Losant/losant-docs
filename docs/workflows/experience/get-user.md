---
flowclass:
  - Application
  - Experience
description: Learn more about the Losant Get Experience User Node.
---

# Get Experience User Node

The Get Experience User Node allows a workflow to retrieve one or more [Experience Users](/experiences/users/) from the current application and add them to the current workflow payload.

![Get Experience User Node](/images/workflows/experience/get-user-node.png "Get Experience User Node")

## Configuration

There are two ways to query for experience users using this node - by user email/ID, or by user tags. When querying by email/ID, the configuration expects a single value which can be either a user's ID or a user's email (the node automatically determines what it is based on the form of the input). This value is is [templatable](/workflows/accessing-payload-data/#string-templates) and so can be pulled off of the current workflow payload.

When querying by user tags, the configuration expects one or more tag key/value pairs, and *all* of the pairs have to match the user in order for the user to be returned by the query. The same rules apply here that apply to tag queries in the rest of Losant - if a key is provided but no value, any user with that tag key will match (and value will not matter), and if a value is provided but no key, any user with that tag value will match (and key will not matter). The key and value fields here are [templatable](/workflows/accessing-payload-data/#string-templates) as well.

![Get Experience User Node Configuration](/images/workflows/experience/get-user-node-config.png "Get Experience User Node Configuration")

The query result will be stored at the [payload path](/workflows/accessing-payload-data/#payload-paths) provided in the `Result Path` field. If the query is configured to potentially return multiple users, this will always be an array, even if no users are found. If the query is only returning a single user (which is always the case for email/ID queries), this will either be the user object or will be `null`.

![Get Experience User Node Result](/images/workflows/experience/get-user-node-config-result.png "Get Experience User Node Result")

In the example above, the workflow will retrieve the user that has the `externalId` tag matching the value at `data.query.systemId` on the payload. It is only expecting a single user to be returned, and will place the resulting user at `data.userResult`. For example, the payload after the Get Experience User Node runs might look like the following:

```json
{
  "data": {
    "query": {
      "systemId": "myExternalSystemId"
      ...
    },
    "userResult": {
      "email": "test.user@example.com",
      "firstName": "Test",
      "lastName": "User",
      "applicationId": "58dc4ec29e8df60001fbea01",
      "creationDate": "2017-03-30T00:18:23.902Z",
      "lastUpdated": "2017-03-30T00:18:59.019Z",
      "userTags": {
        "externalId": "myExternalSystemId"
      },
      "passwordLastUpdated": "2017-03-30T00:18:23.903Z",
      "lastLogin": "2017-03-30T00:18:59.015Z",
      "experienceUserId": "58dc4ecf9e8df60001fbea0a",
      "id": "58dc4ecf9e8df60001fbea0a",
      "experienceGroups": [
        {
          "id": "58dc4ece9e8df60001fbea02",
          "name": "My Example Group"
        }
      ]
    },
    ...
  },
  ...
}
```
