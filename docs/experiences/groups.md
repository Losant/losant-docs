# Experience Groups

An Experience Group is a collection of [users](/experiences/users/) and [endpoints](/experiences/endpoints/) for controlling access to your application's Experience. Only users included in the group may access the endpoints within the group. This is useful for setting up administration routes within your Experience; for example, only a subset of your users may create other Experience Users or delete resources.

## Viewing Experience Groups

![Experience Groups](/images/experiences/groups-list.png "Experience Groups")

Groups are can be accessed through the "Groups" menu item of your application's "Experience" menu. Click the group's name in the list to view view or modify user membership. Note: while endpoints can also belong to groups, endpoint membership can only be modified on the endpoint edit page.

## Adding an Experience Group

![Add Group](/images/experiences/add-group.png "Add Group")

From the Groups list page, click "Add Group" in the top right corner. This will take you to a page where the new group can be configured.

## Group Configuration

![Group Config](/images/experiences/group-config.png "Group Config")

Group configuration takes four parameters:

* **Name** is simply the name of the group; it is for display purposes only and in no way affects the group's functionality, nor is it ever exposed to your users. The field is required.
* **Description** is a longer description of the group. Similar to the name, it is only for display purposes.
* **Users** is an array of users to include in the group. Any user who is not in the group will not have access to the endpoints in the group.

### Endpoint Access Control

Note that, if an endpoint is configured to allow **All public users** or **Any authenticated user** in its [access control](/experiences/endpoints/#access-control), that setting will override any group configuration applied to the endpoint. To apply group access to an endpoint, the endpoint's access control must first be set to **Only users who are in the following groups...**.

## Deleting Groups

A group can be deleted by clicking the "Delete" icon next to any group on the list page, or by clicking the "Delete" button in the footer of a group's edit page. Note that deleting a group **does not** delete the users or endpoints currently associated with that group.
