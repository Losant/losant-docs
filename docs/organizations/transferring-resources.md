---
description: Learn about transferring resources between Sandboxes and Organizations.
---

# Transferring Resources

It is possible to transfer [applications](/applications/overview/) and [dashboards](/dashboards/overview/) to and from your [Sandbox](/user-accounts/sandbox/) and any [organization](/organizations/overview/) you are an administrator of. The most common case is users migrating resources from their Sandbox to a newly created organization.

## Transferring en Masse

![Transfer Link](/images/organizations/transfer-link.png "Transfer Link")

To begin the process, select `Transfer Resources` from the header's `Organizations` tab.

### Choosing the Source and Destination

![Transfer Select Parties](/images/organizations/transfer-select-parties.png "Transfer Select Parties")

By default, `My Sandbox` is selected as the transfer's `Source`, but it is possible to set the Sandbox as the `Destination` by choosing an organization as the source.

While all organizations you are a member of will be listed in the dropdowns, you may only select organizations for which you are an administrator.

**Note**: If you begin selecting resources to transfer and then change the source, your selections will be cleared and you will have to start the process again.

### Applications

After selecting a `Source` and `Destination`, a list of applications for each will display. Clicking an application in the `Source` column will mark it for transfer; the application will take on an "outbound" appearance, and the same application will appear in the `Pending Transfers` section in the destination column. Clicking the application again (in either column) will remove the application from the pending transfer list.

![Transfer Applications](/images/organizations/transfer-applications.png "Transfer Applications")

If any application in the `Source` column can not be transferred – most likely because the application's device count would be the destination over its own device limit – the application will be marked unavailable for transfer.

At the bottom of the application lists are device count summaries for both the source and destination, showing how many devices will be in each after the transfer is completed.

### Dashboards

Like with applications, a list of dashboards belonging to the `Source` and the `Destination` will display, and clicking a dashboard will mark it for transfer. Dashboards are not subject to resource limits, therefore you may transfer any number of dashboards regardless of source and destination device counts.

**However**, any dashboard may include blocks from various applications owned by the organization (or, for Sandbox-owned dashboards, from multiple organizations and the user's own Sandbox). Because of this, some dashboard blocks may break after the transfer – both at the source (because a dependent application was transferred out) and at the destination (because a dependent application was not transferred with the dashboard).

![Transfer Dashboards](/images/organizations/transfer-dashboards.png "Transfer Dashboards")

Consider the example above: We are transferring the application "Water Tanks" and the dashboard "Water Tanks & Chemical Levels" from a Sandbox to an organization. This transfer will have the following consequences:

* The Sandbox's "Daily Overview" dashboard will have 14 functioning blocks and two broken blocks after the transfer, because those two blocks depend on the "Water Tanks" application, which is being transferred out of the Sandbox.
* The "Water Tanks & Chemical Levels" dashboard, which is being transferred to the organization, will have five functioning blocks and three broken blocks after the transfer. The five blocks will continue to function because their dependent application ("Water Tanks") is being transferred with the dashboard; the other three blocks will break because their applications are not being transferred.
* The Sandbox's "My Great Dashboard" is unaffected because none of its blocks reference the "Water Tanks" application.

### Completing the Transfer

After choosing your resources and reviewing your selections, you may complete the transfer by clicking the `Transfer` button. The button's label will reflect the number of applications and/or dashboards that have been marked for transfer. On successful transfer, you will be redirected to the destination's overview page.

## Transferring Individual Resources

![Transfer Single Item](/images/organizations/transfer-single-item.png "Transfer Single Item")

From the `Settings` page of any application or dashboard, you may change the resource's owner (assuming you are an administrator of the current owner organization, or the resources is in your Sandbox). Selecting a new owner and clicking the "Continue" button will redirect you to the `Transfer Resources` page with the source, destination and application or dashboard pre-selected. You may then review the transfer before finalizing the move.
