# Organizations

Organizations allow users to unlock the full potential of the Losant Platform by allowing multiple [members](/organizations/members/) to collaborate on shared [applications](/applications/overview/) and [dashboards](/dashboards/overview/). Additionally, organizations have significantly higher limits than [Sandboxes](/user-accounts/sandbox/) on [devices](/devices/overview/), [payload counts](/organizations/resource-limits/#payload-limits) and data retention periods, as well as additional platform support options.

You can see all the organizations that you are a member of on the <a href="https://app.losant.com/#/organizations" target="\_blank">organization listing page</a> page, which can be found in the menu under your name on the top right of the screen.

![Organization Overview](/images/organizations/organization-overview.png "Organization Overview")

Selecting an organization will take you to the home page of the organization. Here you can see all the applications and dashboards owned by the organization, as well as the current organization members. This is also where you have the option to [leave an organization](/organizations/members/#leaving-an-organization) if you no longer wish to be a member.

## Creating a New Organization

Any user can create a new organization at any time. There are a handful of links throughout the platform that will lead a user to create a new organization; two of the most visible are a button on the user's Sandbox, and in the `Organizations` dropdown in the main site header.

![Organization Creation Link](/images/organizations/organization-create-cta.png "Organization Creation Link")

### Choosing a Plan

Choose a billing plan that will meet the short-term needs of your new organization by clicking its `Select Plan` button, then click the `Continue` button at the bottom of the page. Note that the tier can be upgraded (or downgraded) at any time.

![Organization Plan](/images/organizations/organization-choose-plan.png "Organization Plan")

If none of the predefined tiers will meet the needs of your new organization, or if you need additional functionality that is not part of the existing tiers, you may [contact Losant](mailto:hello@losant.com) about an Enterprise contract.

### Entering Organization Info

After choosing a plan, you will fill out the following information to complete the organization creation. All of these can be changed at a later time:

* **Name:** The name of the organization. This will be visible to all members of the organization.
* **Icon Color:** This is simply to help identify your organization in lists of applications, dashboards and other organizations. The letters within the icon are a derivative of the organization name. The color can be changed by clicking the icon. Note that this icon is never visible to the public.
* **Description:** An optional description of the organization.
* **Billing Email Address:** Defaults to your user's email address.
* **Payment Info:** The credit card that will be billed for this new organization on a recurring basis. The first charge will be placed immediately on organization creation; this charge is for the upcoming billing period.

![Organization Setup](/images/organizations/organization-creation-inputs.png "Organization Setup")

When you're finished, click the `Create Organization` button at the bottom of the screen. Once the organization is created, you can create new resources for the organization (see below); [invite members](/organizations/members/#inviting-new-members) to join the organization; or [transfer resources](/organizations/transferring-resources/) from your Sandbox (or from other organizations) into the new organization.

## Creating Organization Resources

If you have `Editor` permissions for at least one organization, you will have the option of setting the owner of any new application or dashboard you create to one of your organizations, or to your own [Sandbox](/user-accounts/sandbox/).

![Organization New Resource Owner](/images/organizations/organization-new-resource-owner.png "Organization New Resource Owner")

If the resource has already been created, and you have `Administrator` permissions for its owner organization, you will have the option of transferring ownership of that resource to another organization where you have `Administrator` permissions or to your own `Sandbox`. Note that, when transferring resources, the entity receiving the transfer must not exceed any of its [resource limits](/organizations/resource-limits/) or the transfer will fail.

## Managing Organizations

![Organization Settings Link](/images/organizations/organization-settings-link.png "Organization Settings Link")

If you have the Administrator role in this organization, there will be a `Settings` link in the organization subnavigation. Clicking this will take you to a page where you can edit many aspects of the organization itself.

### Overview

![Organization Settings Overview](/images/organizations/org-settings-overview.png "Organization Settings Overview")

From here you can edit the organization's name, description and icon color.

#### Deleting an Organization

You may also delete the organization from this screen by clicking the `Delete Organization` button in the bottom bar. **This cannot be undone**, so be absolutely sure before taking this action.

Deleting an organization will:

* Delete all applications tied to the organization, including all sub-resources under those applications (devices, workflows, etc.)
* Delete all data tied to those applications and their sub-resources.
* Delete all dashboards tied to the organization.
* Nullify any pending organization invitations.
* Cancel the organization's billing plan, meaning the credit card on file will no longer get billed after the final invoice (if charges exist). If the account has a credit, that amount will be applied back to the credit card on file.

Deleting an organization will **NOT**:

* Delete or otherwise affect the Losant accounts of any organization member, including those members' Sandbox resources or resources tied to other organizations
* Cancel any outstanding debt for provided services.

### Usage

![Organization Settings Usage](/images/organizations/org-settings-usage.png "Organization Settings Usage")

This screen displays your detailed resource and payload usage for the current billing period.

### Payment Method

![Organization Settings Payment Method](/images/organizations/org-settings-payment.png "Organization Settings Payment Method")

The recurring payment method can be updated on this screen.

#### If Payment Method Fails ...

Should Losant attempt to charge the credit card on file and the charge fails, the organization will be put in a `Past Due` status. A notification bar at the top of the organization screen, as well as atop any application or dashboard owned by the organization, will alert you to this. [Public and password-protected dashboards](/dashboards/overview/#dashboard-access-control) will never display this notification.

![Organization Delinquent Status](/images/organizations/org-delinquent-bar.png "Organization Delinquent Status")

While your organization's payment is past due, **all platform features will continue to function as normal**, and we will attempt to charge the card on file again every seven days until the charge is successful. Should you need to change the card on file, you should do so immediately so that the change is picked up on the next billing attempt.

After 28 days of being in `Past Due` status, the account will be moved to an `Unpaid` status. At this time, **all payloads will be rejected** and your applications and dashboards will cease to function. You will have to update the organization's payment method to reactivate the account. At that time, all outstanding invoices will be charged, and if successful, the organization's full functionality will be restored.

### Billing Plan

![Organization Settings Plan](/images/organizations/org-settings-plan.png "Organization Settings Plan")

Here you can upgrade or downgrade your billing plan at any time. Changes will be prorated and the extra charge (or credit) will appear on your next invoice. Note that downgrading may lead to overage charges if your new plan has fewer monthly payloads than your applications are currently using.

### Invoices

![Organization Settings Invoices](/images/organizations/org-settings-invoices.png "Organization Settings Invoices")

Here you'll find a list of the last 12 invoices for your organization, including the invoice date, its payment status and the amount billed. Clicking any invoice will show you additional details about that billing period, including line-item charges and application usage.
