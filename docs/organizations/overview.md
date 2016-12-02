# Organizations

Organizations allow users to unlock the full potential of the Losant platform by allowing multiple users to collaborate on shared [applications](/applications/overview) and [dashboards](/dashboards/overview). Additionally, organizations have significantly higher limits than [Sandboxes](/user-accounts/sandbox) on [devices](/devices/overview), [payload counts](/organizations/resource-limits/#payloads-limits) and data retention periods, as well as additional platform support options.

## Organization Membership and Roles

There are three levels of organization membership:

*   **Viewer**: A member with the Viewer role can see the contents of an organization, including all applications and dashboards owned by that organization, but can not change or modify anything about those applications, dashboards, or the organization itself. This extends into any application as well - with the Viewer role, a user can see devices and workflows inside an org-owned application, but will not be able to modify them.
*   **Editor**: A member with the Editor role can do everything a member with the Viewer role can do, plus ...
    * Modify applications or dashboards owned by the organization
    * Create new applications or dashboards in that organization
    * Create or modify sub-resources within the org-owned application (e.g. devices, workflows)
*   **Administrator**: At all times, an organization is required to have one member with the Administrator role. A member with the Administrator role can do everything a member with the Editor role can do, plus ...
    * Modify and manage the organization itself (name, description, billing plan)
    * Manage organization membership (invite / remove members and change member roles)
    * [Transfer resources](/organizations/transferring-resources) to or from the organization, into or out of their own [Sandbox](/user-accounts/sandbox) or any organization where they are also an administrator.

An organization can have multiple members, with limits on members and pending invitations depending on the organization's tier level. The organization's overview screen displays a list of current members, and the `Members` screen provides more details on each member. If you're an Administrator, that screen also displays a list of pending and expired invitations.

### Inviting New Members

### Managing Existing Members

## Managing Organizations

### Overview

### Usage

### Billing Plan

### Payment Method

### Invoices

You can see all the organizations that you are a member of on the <a href="https://app.losant.com/#/organizations" target="\_blank">organization listing page</a> page, which can be found in the menu under your name on the top right of the screen.

![Organization Home](/images/organizations/org-home.png "Organization Home")

If you select an organization, you will be taken to the home page of the organization, similar to the screenshot above.  Here you can see all the applications and dashboards owned by the organization, as well as the current organization members.  This is also where you have the option to leave an organization if you no longer wish to be a member.

If you have the Administrator role in this organization, there will be a "Settings" link in the upper right.  Clicking this will take you to a page where you can edit the organization itself, as well as manage and invite users.

![Organization Settings](/images/organizations/org-settings.png "Organization Settings")

You can remove current members, or change the role of current members - although you cannot change your own role.  You can also send out invitations to the organization by email address - users that you invite will receive an invitation email from Losant with a link which will allow them to accept (and thereby become an organization member) or decline the invitation.
