# Organizations

Organizations are used to group and share Applications and Dashboards among multiple users in Structure.  You can create a Structure organization on the <a href="https://app.getstructure.io/#/organizations/new" target="_blank">new organization</a> page.

## Organization Ownership

Like users, organizations can own Applications and Dashboards.  When an organization owns an application or a dashboard, that item is now visible to all members of the organization.  If you are a member of an organization and have the Edit or Admin role, when you create a new application or dashboard, you will have to option of specifying if it should be owned by yourself or by an organization that you are a member of.

![Dashboard With Owner](/images/organizations/dash-with-owner.png "Dashboard With Owner")

For example, in the above screenshot, we are creating a new dashboard which will belong to the organization "Embree Org".

## Organization Membership and Roles

An organization can have many users who are members in that org, and each user has a role.  There are three possible roles for a member: View, Edit, and Admin.

*   **View**: A member with the View role can see the contents of an organization, including all applications and dashboards owned by that organization, but can not change or modify anything about those applications, dashboards, or the organization itself.  This extends into any application as well - with the View role, a user can see devices and workflows inside an org-owned application, but will not be able to modify them.
*   **Edit**: A member with the Edit role can do everything a member with the View role can do, but can in addition modify applications or dashboards owned by the organization (and can also create new applications or dashboards in that organization).
*   **Admin**: A member with the Admin role can do everything a member with the Edit role can do, and in addition can modify and manage the organization itself (for instance, inviting new members).  At all times, an organization is required to have one member with the Admin role, but other than that there are no limits on membership.

## Managing Organizations

You can see all the organizations that you are a member of on the <a href="https://app.getstructure.io/#/organizations" target="_blank">organization listing page</a> page, which can be found in the menu under your name on the top right of the screen.

![Organization Home](/images/organizations/org-home.png "Organization Home")

If you select an organization, you will be taken to the home page of the organization, similar to the screenshot above.  Here you can see all the applications and dashboards owned by the organization, as well as the current organization members.  This is also where you have the option to leave an organization if you no longer want to be a member.

If you have the Admin role in this organization, there will be a "Settings" link in the upper right.  Clicking this will take you to a page where you can edit the organization itself, as well as manage and invite users.

![Organization Settings](/images/organizations/org-settings.png "Organization Settings")

You can remove current members, or change the role of current members - although you cannot change your own role.  You can also send out invitations to the organization by email address - users that you invite will receive an invitation email from Structure with a link which will allow them to accept (and thereby become an organization member) or decline the invitation.
