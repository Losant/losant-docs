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

## Public Dashboards

Dashboards can be made public - which means that anyone going to the url for a dashboard can see that dashboard.  This is great for sharing public data, but remember that any data exposed in a public dashboard is *public* and is accessible by anyone.  Do not make your dashboard public if it contains any private or sensitive data.  You can control if your dashboard is public on the settings page for the dashboard:

![Public Checkbox](/images/dashboards/public-checkbox.png "Public Checkbox")

NOTE: There are certain dashboard blocks that will not display any data on public dashboards, because in general they expose large amounts of data about the underlying application or account.  These are the `Application List`, `Workflow List`, `Device List`, `Event List` and `Device Connection Log` blocks.  All other blocks display identically when viewed publicly.
