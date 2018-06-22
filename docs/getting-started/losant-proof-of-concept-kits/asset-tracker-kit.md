# Asset Tracker Kit Instructions

The Asset Tracker Kit makes it easy to locate your equipment or merchandise in real time with cellular-based GPS trackers, and to receive geofence-based alerts. The following instructions will guide you through setting up your hardware, accessing your dashboards, and customizing your settings.

![Asset Tracker Kit](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/asset-tracker-kit.jpg "Asset Tracker Kit")

Your kit should include the following items:

* 3 GL505 Asset Trackers
* 3 SIM cards (installed in each GL505)
* 2 CR123A batteries or rechargeable battery pack

## How to Install

1. Remove the battery cover from each of the GL505 tracking devices.
2. Remove the plastic tabs from the batteries.
3. Reattach the battery cover. Once your device is powered on, it will automatically start reporting its location. You will receive a notification email confirming that your device is working properly.
4. Attach tracking devices to your assets using the included Velcro or zip ties.

## View Dashboard

1. [Log in to your Losant account](https://accounts.losant.com) with the information provided to you in the Welcome Email.
2. After logging in, in the application header, click “Dashboards” → “View All Dashboards”.
3. In the dashboards list, click "Asset Tracker”.

## Dashboard Blocks

### Trackers

This shows all of your assets on one map.

![Trackers](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/trackers.jpg "Trackers")

#### Tracker Details

You have access to the following information for each of your trackers.

![Tracker Details](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/tracker-details.jpg "Tracker Details")

### Location

This plots the location of your asset during the last 7 days.

![Location](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/location.jpg "Location")

### Status

This displays the current distance of your asset from the center point. If your asset tracker is not reporting correctly, it will be displayed here.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/status.png" alt="Status" />

### Movement Status

The displays whether your asset is idle or in transit.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/movement-status.png" alt="Movement Status" />

### GPS Location

This shows the current GPS coordinate of your asset.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/gps-location.png" alt="GPS Location" />

### Temperature

This displays the ambient temperature around your asset.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/temperature.png" alt="Temperature" />

### Speed

This displays the current speed if your device is in transit.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/speed.png" alt="Speed" />

### Battery

This shows the battery life of the asset tracker. If your device's batteries die, they can be replaced with two [CR123A batteries](https://www.amazon.com/AmazonBasics-Lithium-CR123a-Batteries-12-pack/dp/B01KBEORDK).

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/battery.png" alt="Battery" />

### History

This shows historical data with the speed, distance from center, and whether your device was inside or outside the geofence.

<img style="width: 400px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/history.png" alt="History" />

All of these blocks can be configured by navigating to the right side of the block's header, clicking the gear icon, and then clicking
"Edit Settings" in the dropdown menu. There are links to the documentation in each “Edit Block” page.

## Configuring Settings

Your PoC Kit allows you to configure your geofence alert settings, email, and SMS number. You can configure your settings by doing the following:

1. Log in to <a href="https://accounts.losant.com" target="_blank">accounts.losant.com</a>.
2. On the next screen, in the header, click “Applications” → “View All Applications”.
3. In the applications list, click “Asset Tracker”.
4. In the gray application navigation bar, click “Settings”.
5. In the left column of the Settings page, click “Globals”.
6. You can edit the following settings.
    * **SMS**: Phone number used to receive alerts.
    * **EMAIL**: Email used to receive alerts.
    * **GEOFENCE_CENTER**: This is the latitude and longitude coordinates to use as the center point for your geofence based alerts.
    * **GEOFENCE_LIMIT_MILES**: Set the radius distance in miles for your geofence alerts. Ex: If this field is set to 20, you will be notified when your assets are 20+ miles away from your GEOFENCE_CENTER coordinates.

## Enable/Disable Alerts

1. Log in to <a href="https://accounts.losant.com" target="_blank">accounts.losant.com</a>.
2. On the next screen, in the header, click “Applications” → “View All Applications”.
3. In the applications list, on “Asset Tracker”.
4. In the gray application navigation bar, click "Workflows" → “View All Workflows".
5. In the workflows list, click the toggle switch to enable or disable your alerts.

![Toggle Alerts](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/toggle-alerts.png "Toggle Alerts")

### Need Support?

Visit <a href="https://docs.losant.com" target="_blank">docs.losant.com</a>, email us at <a href="mailto:support@losant.com">support@losant.com</a> or reach us at <a href="https://forums.losant.com" target="_blank">forums.losant.com</a>.
