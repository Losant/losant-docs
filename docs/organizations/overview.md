---
description: Learn about creating and managing Losant Organizations.
---

# Organizations

Organizations allow users to unlock the full potential of the Losant Platform by allowing multiple [members](/organizations/members/) to collaborate on shared [applications](/applications/overview/) and [dashboards](/dashboards/overview/). Additionally, organizations have significantly higher limits than [Sandboxes](/user-accounts/sandbox/) on [devices](/devices/overview/), [payload counts](/organizations/resource-limits/#payload-limits) and data retention periods, as well as additional platform support options.

You can see all the organizations that you are a member of on the <a href="https://app.losant.com/organizations" target="\_blank">organization listing page</a> page, which can be found in the menu under your name on the top right of the screen.

![Organization Overview](/images/organizations/organization-overview.png "Organization Overview")

Selecting an organization will take you to the home page of the organization. Here you can see all the applications and dashboards owned by the organization, as well as the current organization members. This is also where you have the option to [leave an organization](/organizations/members/#leaving-an-organization) if you no longer wish to be a member.

## Organization Pricing

Organization pricing is a function of a number of factors:

* The number of resources your applications will require (such as [devices](/devices/overview/), [organization members](/organizations/members/) and [experience users](/experiences/users/))
* How many [payloads](/organizations/resource-limits/#payload-limits) you expect to generate per month
* Your [data retention](/organizations/resource-limits/#data-retention) requirements
* Costs for our solutions team assisting in the buildout of your IoT application (if required)
* Other special factors, such as if you require on-premises installation of the platform, single tenancy or SLAs

## Creating a New Organization

[Contact Losant](https://www.losant.com/contact-us) for more information about setting up your organization. Once a contract is in place, the Losant team will take care of creating

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

Deleting an organization will **NOT**:

* Delete or otherwise affect the Losant accounts of any organization member, including those members' Sandbox resources or resources tied to other organizations
* Cancel any outstanding debt for provided services.

### Usage

![Organization Settings Usage](/images/organizations/org-settings-usage.png "Organization Settings Usage")

This screen displays your detailed resource and payload usage for the monthly period.
