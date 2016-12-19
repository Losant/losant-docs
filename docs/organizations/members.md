# Organization Members

An organization can have multiple members, with limits on members and pending invitations depending on the organization's tier level. The organization's overview screen displays a list of current members, and the `Members` screen provides more details on each member. If you're an Administrator, that screen also displays a list of pending and expired invitations.

![Organization Members Home](/images/organizations/organization-members-home.png "Organization Members Home")

## Member Roles

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

## Managing Existing Members

![Organization Members](/images/organizations/organization-members.png "Organization Members")

Administrators can change the role of any organization member (other than themselves) from the `Members` page. The user's current role is displayed in a drop-down box to the right of their user info. Simply select a new role for the user to complete the change. It is not necessary to confirm your change, and it is very easy to change the user's role back immediately after your initial change.

Administrators can also remove any current organization member – including other administrators – by clicking the `Remove` (-) icon to the right of the user's name. This does not delete the user's Losant account; it simply cuts off their access to your organization. Any user removed from an organization can always be re-invited at a later date.

## Inviting New Members

![Organization Pending Invites](/images/organizations/organization-pending-invites.png "Organization Pending Invites")

Further down the `Members` page is a list of pending organization invitations and an input box for inviting additional members. To invite a new member, enter their email address in the provided box and choose a role for the new user. Doing so will allow you to add additional invitations should you choose to do so.

Pending invitations are limited by the maximum number of members your organization can have. For example, if your organization can have a maximum of five members, and the organization already has three members, you may only have two pending invitations open at any time.

Once all of your invitations are ready, click the `Send Invitations` button at the bottom of the list. Each of your invitees will receive an email with instructions on how to join your organization. If they do not already have a Losant account, they can create one as part of the invitation acceptance process.

To revoke a pending invitation - whether it has already been sent or not – click the `Remove` (-) icon to the right of the invitee's info. If you need to change an invitee's role, you will either have to wait for the user to accept the invitation and then change their access, or you will have to revoke the current invitation and send the user a new one.

![Organization Expired Invites](/images/organizations/organization-expired-invites.png "Organization Expired Invites")

## Expired Invitations

Any invitation that was not accepted after seven days appears in the `Expired Invitations` section of the `Members` page. Invitations in this state do not count against your new invitation limit. Invitees whose invitation has expired can no longer join your organization.

### Renewing Expired Invitations

Any pending or expired invitation can be renewed by clicking the `Renew` link. This resets the timer on the invitation's seven-day expiration timeline, and any expired invitation's link is once again valid.

## Leaving an Organization

You may leave an organization at any time by clicking the `Leave Organization` button on the organization overview screen, **except** under the following circumstances:

1.   You are an Administrator of the organization, AND
2.   There are no other Administrators for the organization

In those circumstances, you will have to change the permission of an existing organization member to `Administrator`, and then you may depart the organization.

Leaving an organization will **not** cancel your Losant account. No resources will be removed from your Sandbox or any organization you are a member of (including the organization you just left). At any time, a member of your recently departed organization can invite you to re-join the organization. Should you accept the invitation, you will re-enter the organization at the new invitation's permission level.
