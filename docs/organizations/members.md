# Organization Members

An organization can have multiple members, with limits on members and pending invitations depending on the organization's tier level. The organization's overview screen displays a list of current members, the `Members` screen allows an administrator to perform quick actions such as removing a member or renewing a pending invite, and the `Edit Member` screen provides more details on each member. Both the `Members` and `Edit Member` screens are only visible to Administrators. If you're an Administrator, the organization's overview screen will display pending and expired invitations.

![Organization Members Home](/images/organizations/organization-members-home.png "Organization Members Home")

## Member Roles

There are five levels of default organization membership:

* **None**: A member with the None role cannot see any of the contents of an organization. They cannot change or modify anything within the organization. This extends to all assets of the organization.
* **Viewer**: A member with the Viewer role can see the contents of an organization, including all applications and dashboards owned by that organization, but can not change or modify anything about those applications, dashboards, or the organization itself. This extends into any application as well - with the Viewer role, a user can see devices and workflows inside an org-owned application, but will not be able to modify them.
* **Collaborator**: A member with the Collaborator role can do everything that a member with the Viewer role can do, plus ...
    * Modify applications or dashboards owned by the organization
    * Create or modify sub-resources within the org-owned application (e.g. devices, workflows)
* **Editor**: A member with the Editor role can do everything a member with the Collaborator role can do, as well as create new applications or dashboards in that organization.
* **Administrator**: At all times, an organization is required to have one member with the Administrator role. A member with the Administrator role can do everything a member with the Editor role can do, plus ...
    * Modify and manage the organization itself (name, description and icon color)
    * Manage organization membership (invite / remove members and change member roles)
    * [Transfer resources](/organizations/transferring-resources/) to or from the organization, into or out of their own [Sandbox](/user-accounts/sandbox/) or any organization where they are also an administrator.

Along with default organization roles, members can be assigned roles on a per application or dashboard basis. These granular permissions act as overrides for the member's assigned default role. The available granular permissions include:

* None
* Viewer
* Collaborator

## Managing Existing Members

Administrators can view all of the organizations members. Here the user's name, email, and role are displayed as well as any actions available for that member. Here, administrators may remove members - including other administrators - by clicking the `Remove` icon in the furthest right table column. This does not delete the user's Losant account; it simply cuts off their access to your organization. Any user removed from an organization can always be re-invited at a later date.

![Organization Members](/images/organizations/organization-members.png "Organization Members")

Administrators can change the role of any organization member (other than themselves) from the `Edit Member` page. This can be accessed by clicking on the member's email on either the `Organization Overview` or the `Members` screen. The user's current role is displayed in a drop-down box below their user info. Below this, administrators may also set the member's granular permissions. Here administrators may select an individual application/dashboard as well as a permission that only applies to the selected asset. Simply select a new role for the user and optionally any granular permissions and click the `Update Member` button in the footer to complete the changes.

Administrators can also remove any current organization member – including other administrators – by clicking the `Remove Member` button in the footer. Then by confirming this action.

## Inviting New Members

To invite a new member, click the `Add` button at the top right of the table. This can also be done from the `Organization Overview` screen. This will navigate you to the `New Member` screen. Here simply input the new member's email in the provided box, choose a default permission, and optionally choose any granular permissions to assign. Then, simply click the `Send Invite` button in the bottom left to send the invitation.

![Organization New Invite](/images/organizations/organization-new-invite.png "Organization New Invite")

Pending invitations are limited by the maximum number of members your organization can have. For example, if your organization can have a maximum of five members, and the organization already has three members, you may only have two pending invitations open at any time.

Each of your invitees will receive an email with instructions on how to join your organization. If they do not already have a Losant account, they can create one as part of the invitation acceptance process.

Once a user is invited, administrators may view the details of the invitation from the `Invite Details` screen. This can be accessed by clicking on the email of the invitee from either the `Organization Overview` or `Members` screen.

![Organization Invite Details](/images/organizations/organization-invite-details.png "Organization Invite Details")

To revoke a pending invitation, click `Revoke Invitation` to the right of the invited user's email and confirm this action. Administrators may also revoke any invitation from the `Members` screen by clicking the `Remove` icon in the furthest right table column. If you need to change any of the invitee's roles, you will either have to wait for the user to accept the invitation and then change their access, or you will have to revoke the current invitation and send the user a new one.

## Expired Invitations

Any invitation that was not accepted after seven days has expired. Invitations in this state do not count against your new invitation limit. Invitees whose invitation has expired can no longer join your organization, but can always be sent a new invitation (or a renewal).

### Renewing Expired Invitations

Any pending or expired invitation can be renewed by clicking the `Renew` link on either the `Members` screen or the `Individual Invite` screen. This resets the timer on the invitation's seven-day expiration timeline, and any expired invitation's link is once again valid.

![Organization Expired Invites](/images/organizations/organization-expired-invite.png "Organization Expired Invites")

## Leaving an Organization

You may leave an organization at any time by clicking the `Leave Organization` button on the organization overview screen, **except** under the following circumstances:

1. You are an Administrator of the organization, AND
1. There are no other Administrators for the organization

In those circumstances, you will have to change the permission of an existing organization member to `Administrator`, and then you may depart the organization.

Leaving an organization will **not** cancel your Losant account. No resources will be removed from your Sandbox or any organization you are a member of (including the organization you just left). At any time, a member of your recently departed organization can invite you to re-join the organization. Should you accept the invitation, you will re-enter the organization at the new invitation's permission level.
