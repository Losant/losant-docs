# Asset Tracker Kit Instructions

The Asset Tracker Kit makes it easy to locate your equipment or merchandise in real-time with cellular-based GPS trackers and receive geofence based alerts. The following instructions will guide you through setting up your hardware, accessing your dashboards, and customizing your settings.

![Asset Tracker Kit](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/asset-tracker-kit.jpg "Asset Tracker Kit")

Your kit should include the following items:

* 3 GL505 Asset Trackers
* 3 SIM cards (installed in GL505)
* 2 CR123A batteries or rechargable battery pack

## How to Install

1. Remove the battery cover from each of the GL505 tracking devices.
2. Remove the plastic tabs from batteries.
3. Reattach battery cover. Once your device is powered on, it will automatically start reporting it's location. You will receive a notification email confirming that your device is working properly.
4. Attach tracking devices to your assets using the included Velcro or zip ties.

## View Dashboard

1. Log in to https://accounts.losant.com with the information provided to you in the Welcome Email.
2. Click on “Dashboards” → “View All Dashboards”.
3. Click on "Asset Tracker”.

## Dashboard Blocks

**Trackers**

This shows all of your assets on one map.

![Trackers](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/trackers.jpg "Trackers")

### Tracker Details

You have access to the following information for each of your trackers.

![Tracker Details](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/tracker-details.jpg "Tracker Details")

**Location**

This plots the location of your asset during the last 7 days.

![Location](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/location.jpg "Location")

**Status**

This displays the current distance of your asset from the center point. If your asset tracker is not reporting correctly, it will be displayed here.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/status.png" alt="Status" />

**Movement Status**

The will display where or not your asset is idle or in-transit.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/movement-status.png" alt="Movement Status" />

**GPS Location**

This shows the current GPS coordinate of your asset.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/gps-location.png" alt="GPS Location" />

**Temperature**

This displays the ambient temperature around your asset.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/temperature.png" alt="Temperature" />

**Speed**

This displays the current speed if your device is in-transit.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/speed.png" alt="Speed" />

**Battery**

This shows the battery life of the asset tracker. If your device batteries die, they can be replaced with two CR123A batteries.

<img style="width: 200px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/battery.png" alt="Battery" />

**History**

This shows historical data with the speed, distance away, and whether or not you device is inside or outside the geofence

<img style="width: 400px; margin: 0 auto; display: block;" src="/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/history.png" alt="History" />

All of these blocks can be configured by navigating to the right side of the header, clicking the gear icon → Edit Settings. There are links to the documentation in each “Edit Block” page.

## Configuring Settings
Your PoC Kit allows you to configure your geofence alert settings, email, and SMS number. You can configure your settings by doing the following:

1. Log in to <a href="https://accounts.losant.com" target="_blank">accounts.losant.com</a>.
2. Go to “Applications” → “View All Applications”.
3. Click on “Asset Tracker”.
4. Click on “Settings”.
5. Click on “Globals”.
6. You can edit the following settings.
    * **SMS**: Phone number used to receive alerts.
    * **EMAIL**: Email used to receive alerts.
    * **GEOFENCE_CENTER**: This is the latitude and longitude coordinates to use as the center point for your geofence based alerts.
    * **GEOFENCE_LIMIT_MILES**: Set the radius distance in miles for your geofence alerts. Ex: If this field is set to 20, you will be notified when your assets our beyond 20 miles from your GEOFENCE_CENTER coordinates.

## Enable/Disable Alerts

1. Log in to <a href="https://accounts.losant.com" target="_blank">accounts.losant.com</a>.
2. Go to “Applications” → “View All Applications”.
3. Click on “Asset Tracker”.
4. Go to "Workflows" → “View All Workflows".
5. Click on the toggle switch to enable or disable your alerts.

![Toggle Alerts](/images/getting-started/losant-proof-of-concept-kits/asset-tracker-kit/toggle-alerts.png "Toggle Alerts")

### Need Support?

Visit <a href="https://docs.losant.com" target="_blank">docs.losant.com</a>, email us at <a href="mailto:support@losant.com">support@losant.com</a> or reach us at <a href="https://forums.losant.com" target="_blank">forums.losant.com</a>.
