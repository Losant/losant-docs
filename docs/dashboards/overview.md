# Dashboards

Losant dashboards provide a flexible and powerful way to display information relevant to your specific connected solution. Users can have many different dashboards and a single dashboard can display information from many different applications and devices.

![Full Dashboard](/images/dashboards/overview-dashboard-full.png "Full Dashboard")

## Creating a Dashboard

A dashboard can be created at any time from the `Dashboards` dropdown in the site header, or from a few other places within the platform.

When creating a dashboard, you'll be asked for three pieces of information:

* **Dashboard Name:** You are required to name your new dashboard. The name can be changed at any time.
* **Description:** Optionally, you may also provide a more detailed description of the application.
* **Owner:** The dashboard must be scoped to your personal [Sandbox](/user-accounts/sandbox/) or to an [organization](/organizations/overview/) for which you have the [Editor role](/organizations/members/#member-roles). The owner can be changed at a later date only if you have Administrator permissions for the parent organization (or Sandbox).

Note that, should you choose to make your dashboard public, the name and description **will be visible** to those users.

![Create Dashboard](/images/dashboards/create-dashboard.png "Create Dashboard")

After filling out the form, click `Save Dashboard` to start adding blocks.

## Adding Blocks

Losant supports many different blocks for visualizing various pieces of information. New blocks can be added to your dashboard by clicking the `Add Block` link at the top of the dashboard.

<img style="width: 450px; margin: 0 auto; display: block;" src="/images/dashboards/overview-add-block.png" alt="Add Block" />

![Select Block](/images/dashboards/overview-select-block.png "Select Block")

## Application Access

Most dashboard blocks require an [application](/applications/overview/) from which to fetch their data. Dashboards owned by an organization may only pull data from applications owned by that organization, whereas applications owned by a user's Sandbox may pull data from any application owned by the user **or** any organization the user is a member of. This allow users to build their own customized views from various projects across multiple organizations.

## Editing Dashboards

Dashboard blocks can be resized and rearranged to any layout that fits your needs. To move a block, grab the block's header bar with your mouse and move it around the dashboard. To resize a block, grab its bottom right corner with your mouse and expand or contract it vertically or horizontally.

![Dashboard Animation](/images/dashboards/overview-animation.gif "Dashboard Animation")

### Edit Block Configuration

Block configuration – the settings that handle the data displayed and the style of its presentation – can be edited any time after initial block creation. To edit a block, hover your mouse over the block's title bar and click the "Edit" icon (gear). This will take you to a screen where the configuration can be changed.

![Dashboard Edit Icon](/images/dashboards/dashboard-block-edit-icon.png "Dashboard Edit Icon")

Each block type is different; check out each type's entry in the documentation for details on editing its respective configuration.

### Clone an Existing Block

If you have multiple blocks that have similar configurations, it may be quicker to start from one of the blocks, make a few edits and then push a new block to your dashboard. In these cases, cloning an existing block can save time.

![Dashboard Clone Button](/images/dashboards/dashboard-block-clone-btn.png "Dashboard Clone Button")

From an existing block's configuration page, click "Clone Block" in the footer. This will take you to a new page where the block's settings can be adjusted. **Note:** The block will not actually be added to the dashboard until you click "Add Block" at the bottom of this page.

## Display Settings

Within the dashboard settings menu, there are a couple options for changing the dashboard's display style ...

* **Dark Theme** flips the color scheme to a much darker style. This is stored as a user-level preference, so switching to the dark theme on one dashboard will cause other dashboards you visit to also be displayed in the dark theme until you disable the setting.
* **Fullscreen** hides the Losant header and footer and expands the dashboard to fit the screen's dimensions. Not all devices support this feature (smartphones and most tablets specifically), and if your device does not allow fullscreen display, this option will not be visible.

<img style="width: 341px; margin: 0 auto; display: block;" src="/images/dashboards/dashboard-display-settings.png" alt="Dashboard Display Options" />

## Auto Refreshing

Dashboards by default will automatically refresh the data every 60 seconds. You can pause the refreshing at any time by clicking the pause button at the top of the dashboard. You can also force the dashboard to refresh by clicking the refresh button. You can also control the refresh interval under the settings for the dashboard.

<img style="width: 440px; margin: 0 auto; display: block;" src="/images/dashboards/overview-refresh-button.png" alt="Refresh Button" />

## Viewing Past Dashboard States

By default, dashboards show values as of the last time data was fetched from Losant ("Now"). To view the state of your dashboard blocks at a given point in time, open the Time Jumper dropdown and select the "Jump to a specific date/time" option. After choosing a past time, the dashboard will refresh and display each dashboard block as it appeared at that moment.

![Dashboard Time Jumper](/images/dashboards/dashboard-time-jumper.png "Dashboard Time Jumper")

It is also possible to jump backward and forward in time simply by clicking the arrows on either side of the time jumper dropdown. This allows for quick perusing of dashboard states as they progressed over a period of time. By default, the arrows jump 60 minutes forward and backward, but this value can be changed in the Time Jumper dropdown. The arrow jump amount is stored locally on your browser and will be maintained across different dashboards.

<img style="width: 440px; margin: 0 auto; display: block;" src="/images/dashboards/dashboard-time-jumper-arrows.png" alt="Dashboard Time Jumper Arrows" />

A few things to note when viewing past dashboard states:

* **The following dashboard blocks do not update** when viewing a past dashboard state (meaning, they continue to reflect the "as of now" state of the block): Input Controls, Event List, Device List, Workflow List, Application List, Dashboard List, External Website
* When viewing a past state, the dashboard will cease to refresh data on a regular basis.
* **Each individual block will honor its specific duration settings** regardless of the selected date. For example, when viewing 10:00am on June 1, 2016, a Time Series Graph configured to show the last hour of data will display data from 9:00am to 10:00am of that same date. Meanwhile, a Gauge Block set to display a mean aggregation of data collected over the past four hours will show the aggregated value of its attribute as collected from 6:00am to 10:00am that morning.
* If you attempt to go forward in time past the current date/time, the dashboard will automatically revert to displaying "Now" data and the ability to go forward from that point will be disabled.

## Dashboard Access Control

Dashboards have a three levels of access:

* **Private** dashboards are only accessible to you, or members of your organization if it is an organization-owned dashboard.
* **Public** dashboards can be seen by anyone who has the dashboard URL, regardless of whether that person is logged in to a Losant account. This is great for sharing public data, but remember that any data exposed in a public dashboard is *public* and is accessible by anyone. Do not make your dashboard public if it contains any private or sensitive data.
* **Password-protected** dashboards allow anyone with the URL and a global password set by you to view the dashboard. This adds some protection to your dashboard, while still making it easy to share with people who do not have Losant accounts.

You can manage the access control for a dashboard on the settings page for the dashboard:

![Dashboard Access Control](/images/dashboards/dashboard-access-control.png "Dashboard Access Control")

## Embedding In Other Sites

You may wish to display your Losant dashboard, or a collection of blocks from one or more dashboards, into another web page. Losant provides some JavaScript snippets that make it easy to embed these resources into an HTML document.

**NOTE:** The following blocks will not display any data on public dashboards or to non-authorized users when embedded:

* `Application List`
* `Dashboard List`

### Embedding Entire Dashboards

From your dashboard's settings page, click "Embed Dashboard" in the left column. This will bring you to a page where you can configure your embed options, such as:

* **Width** in CSS units (default: 100%)
* **Height** in CSS units (default: the height of dashboard currently)
* **Theme** (default: Light)
* **Fetch Data Every ...** (default: current dashboard setting)

![Embed Dashboard](/images/dashboards/dashboard-embed.png "Embed Dashboard")

This will generate a code snippet, which you can drop into any HTML document at the place where you want the embedded dashboard to appear.

An embedded dashboard only includes the dashboard's blocks, not its title, configuration buttons or Losant header and footer. The image below is a screenshot of a dashboard, where the sections crossed out would not appear if the dashboard were embedded.

![Dashboard Embed Diff](/images/dashboards/dashboard-embed-diff.png "Dashboard Embed Diff")

### Embedding Single Blocks

You may only embed a single block if your [dashboard's access control](#dashboard-access-control) has been set to `public`. To get an embed code, hover over your dashboard block and click the `<>` icon in the block header.

![Embed Block Modal Checkbox](/images/dashboards/embed-block-modal.png "Embed Block Modal")

This will display a modal where you can set the block's `width`, `height` and `theme` properties. For your width and height, make sure to enter a valid CSS length attribute (`%`, `px`, `em`, `vw`, etc.).

## Email Reports

You also have the option to email a report based on a dashboard at a recurring interval. You can do this under the "Email Reports" section in the dashboard settings:

![Email Report Settings](/images/dashboards/email-report-settings.png "Email Report Settings")

You can configure a set of email addresses to receive a PDF report of the dashboard at a regular interval. Choose a time of day and the days of the week to send the report, and you can also configure the subject and message of the email. In the above example, the report will be emailed every Thursday at 10:10am central time to myemail@example.com. The resulting email will include a link to a PDF report of the dashboard at that time, similar to the example below:

<img style="border-top: 0px; border-bottom: 0px" src="/images/dashboards/email-report-example.png" alt="Email Report Example" title="Email Report Example" />