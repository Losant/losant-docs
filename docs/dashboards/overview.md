# Dashboards

Losant dashboards provide a flexible and powerful way to display information relevant to your specific connected solution. Users can have many different dashboards and a single dashboard can display information from many different applications and devices.

![Full Dashboard](/images/dashboards/overview-dashboard-full.png "Full Dashboard")

## Adding Blocks

Losant supports many different blocks for visualizing various pieces of information. New blocks can be added to your dashboard by clicking the `Add Block` link at the top of the dashboard.

![Add Block](/images/dashboards/overview-add-block.png "Add Block")

![Select Block](/images/dashboards/overview-select-block.png "Select Block")

## Editing Dashboards

Dashboard blocks and be dynamically resized and dragged for the arrangement that most meets your specific needs.

![Dashboard Animation](/images/dashboards/overview-animation.gif "Dashboard Animation")

## Auto Refreshing

Dashboards by default will automatically refresh the data every 60 seconds. You can pause the refreshing at any time by clicking the pause button at the top of the dashboard. You can also force the dashboard to refresh by clicking the refresh button.  You can also control the refresh interval under the settings for the dashboard.

![Refresh Button](/images/dashboards/overview-refresh-button.png "Refresh Button")

## Dashboard Access Control

Dashboards have a three levels of access - private, password protected, and public.  Private
means that only you (or members of your organization, if it is an organization-owned
dashboard) can see the dashboard.  Public dashboards can be seen by anyone who has the
dashboard url, regardless of whether that person is logged in to a Losant account. This is great for sharing public data, but remember that any data exposed in a public dashboard is *public* and is accessible by anyone. Do not make your dashboard public if it contains any private or sensitive data. The third level of access is in between public and private -
you can add a password to your dashboard, and allow anyone with the url and the password
to view the dashboard.  This adds some protection to your dashboard, while still making it
easy to share with people who do not have Losant accounts. You can manage the access control for a dashboard on the settings page for the dashboard:

![Dashboard Access Control](/images/dashboards/dashboard-access-control.png "Dashboard Access Control")

## Embedding Dashboard Blocks into Other Sites

If your dashboard has been set to `public`, you may embed any of your dashboard blocks into a third-party site. To get an embed code, hover over your dashboard block and click the `<>` icon in the block header.

This will display a modal where you can set the block's `width`, `height` and `theme` properties. For your width and height, make sure to enter a valid CSS length attribute (`%`, `px`, `em`, `vw`, etc.).

![Embed Block Modal Checkbox](/images/dashboards/embed-block-modal.png "Embed Block Modal")

NOTE: The following blocks will not display any data on public dashboards or to non-authorized users when embedded. In general they expose large amounts of data about the underlying application or account:

* `Application List`
* `Workflow List`
* `Device List`
* `Event List`
* `Device Connection Log`
