---
description: Learn more about creating and using experience groups in the Losant platform.
---

# Experience Groups

An Experience Group is a collection of [users](/experiences/users/) for controlling access to your application's [Experience Endpoints](/experiences/endpoints/). When configuring an endpoint - or within a workflow using the [Verify Group Node](/workflows/experience/verify-group/) - you can limit access to the endpoint or change the user experience based on their group membership. This is useful for setting up administration routes within your Experience; for example, only a subset of your users may create other Experience Users or delete resources.

## Viewing Experience Groups

![Experience Groups](/images/experiences/groups-list.png "Experience Groups")

Groups are can be accessed through the "Groups" menu item of your application's "Experience" menu. Click the group's name in the list to view view or modify user membership. Note: while endpoints can also belong to groups, endpoint membership can only be modified on the endpoint edit page.

## Adding an Experience Group

![Add Group](/images/experiences/add-group.png "Add Group")

From the Groups list page, click "Add" at the top right of the group list. This will take you to a page where the new group can be configured.

## Group Configuration

![Group Config](/images/experiences/group-config.png "Group Config")

Group configuration takes three parameters:

* **Name** is simply the name of the group; it is for display purposes only and in no way affects the group's functionality, nor is it ever exposed to your users. The field is required.
* **Description** is a longer description of the group. Similar to the name, it is only for display purposes.
* **Users** is an array of users to include in the group. Any user who is not in the group will not have access to the endpoints in the group.

## Using Experience Groups

There are three methods by which you may use experience groups to conditionally render or redirect users within your Experience:

1. In an [Experience Endpoint's access control](/experiences/endpoints/#access-control), you may limit an endpoint's access to "Only users who are in the following groups ..." When selected, a request will only be treated as authenticated if the Experience User is signed in AND is a member of one or more of the groups you select.
2. In a workflow, you may use the [Verify Group Node](/workflows/experience/verify-group/) to check if the user making the request is a member of a specific group, and you may branch your workflow's execution based on this. Note that this method is endpoint-agnostic; if you use the first method above to limit the endpoint's access control, and the user is not a member of one of the selected groups, your workflow will never fire.
3. In an Experience View, assuming you do not [override the context](/workflows/outputs/endpoint-reply/#experience-page-response) passed to the page, you will have access to the [user's information](/experiences/views/#data-that-is-always-provided) - including their group membership. Certain portions of the page could be conditionally rendered based on the user's group membership, such as an "Admin" link that takes the user to a gated portion of your Experience.

## Deleting Groups

A group can be deleted by clicking the "Delete" icon next to any group on the list page, or by clicking the "Delete" button in the footer of a group's edit page. Note that deleting a group **does not** delete the users or endpoints currently associated with that group.
