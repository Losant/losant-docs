# Organizations

Organizations allow multiple Losant users to collaborate on applications, workflows, devices, dashboards and more.  To use organizations, you must have a Losant Business Account - if you'd like to learn more about being a business customer, please [contact us](https://www.losant.com/contact-us).

## Organization Ownership

Like users, organizations can own Applications and Dashboards.  When an organization owns an application or a dashboard, that item is now visible to all members of the organization.  If you are a member of an organization and have the Editor or Administrator role, when you create a new application or dashboard, you will have to option of specifying if it should be owned by yourself or by an organization that you are a member of.

![Dashboard With Owner](/images/organizations/dash-with-owner.png "Dashboard With Owner")

For example, in the above screenshot, we are creating a new dashboard which will belong to the organization "Embree Org".

## Organization Membership and Roles

An organization can have many users who are members in that org, and each user has a role.  There are three possible roles for a member: Viewer, Editor, and Administrator.

*   **Viewer**: A member with the Viewer role can see the contents of an organization, including all applications and dashboards owned by that organization, but can not change or modify anything about those applications, dashboards, or the organization itself. This extends into any application as well - with the Viewer role, a user can see devices and workflows inside an org-owned application, but will not be able to modify them.
*   **Editor**: A member with the Editor role can do everything a member with the Viewer role can do, plus ...
    * Modify applications or dashboards owned by the organization
    * Create new applications or dashboards in that organization
    * Create or modify sub-resources within the org-owned application (e.g. devices, workflows)
*   **Administrator**: At all times, an organization is required to have one member with the Administrator role. A member with the Administrator role can do everything a member with the Editor role can do, plus ...
    * Modify and manage the organization itself (name, description, billing plan)
    * Manage organization membership
    * [Transfer resources](/organizations/transferring-resources) to or from the organization, into or out of their own [Sandbox](/user-accounts/sandbox) or any organization where they are also an administrator.


## Managing Organizations

You can see all the organizations that you are a member of on the <a href="https://app.losant.com/#/organizations" target="_blank">organization listing page</a> page, which can be found in the menu under your name on the top right of the screen.

![Organization Home](/images/organizations/org-home.png "Organization Home")

If you select an organization, you will be taken to the home page of the organization, similar to the screenshot above.  Here you can see all the applications and dashboards owned by the organization, as well as the current organization members.  This is also where you have the option to leave an organization if you no longer want to be a member.

If you have the Administrator role in this organization, there will be a "Settings" link in the upper right.  Clicking this will take you to a page where you can edit the organization itself, as well as manage and invite users.

![Organization Settings](/images/organizations/org-settings.png "Organization Settings")

You can remove current members, or change the role of current members - although you cannot change your own role.  You can also send out invitations to the organization by email address - users that you invite will receive an invitation email from Losant with a link which will allow them to accept (and thereby become an organization member) or decline the invitation.
