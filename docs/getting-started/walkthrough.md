# Losant Walkthrough

Don't have a device? No problem! This walkthrough will allow you to experience many of the features in Losant by building a weather station dashboard.

![Full Dashboard](/images/getting-started/walkthrough/dashboard-full.png "Full Dashboard")

In reality, you'll use sensors and hardware to capture the weather information and send that data to Losant. For this walkthrough, instead of real hardware, we can use the <a href="https://darksky.net" target="_blank">Dark Sky API</a> to simulate hardware that sends weather data.

Dark Sky is an API that provides a simple way to acquire weather data. The Dark Sky API is a separate, paid service — you'll have to sign up for an API key (one key per company). With this key, the first 1,000 forecasts per day are free, which is just enough for this walkthrough.

## Step 1: Sign up for Dark Sky API

<a href="https://darksky.net/dev/register" target="_blank">Signing up</a> for the Dark Sky API is extremely simple and only requires an email address. Once you sign up you'll be provided an API key. Keep this handy for future steps. This API key gives you 1,000 requests free each day, which is more than enough for this application.

![Dark Sky API Key](/images/getting-started/walkthrough/dark-sky-api-key.png "Dark Sky API Key")

No, sorry, the API key in the above screenshot won't work.

## Step 2: Create Losant Application

After signing up you'll be prompted to create your first application. You can also go to create an application from the main `Applications` menu at the top of every screen.

![Welcome Page](/images/getting-started/walkthrough/welcome-page.png "Welcome Page")

You can name your application whatever you would like - in this case we have called it
"Weather Station".

![Create Application](/images/getting-started/walkthrough/create-application.png "Create Application")

## Step 3: Add the Device

Now that we have an application we need a [device](/devices/overview/) to store all of our weather data. Add a device using the `Add Device` button or the `Devices` menu. Choose `Create Blank Device` on the following screen, since we want to create from a blank device.

![Add Device](/images/getting-started/walkthrough/add-device.png "Add Device")

The [Dark Sky API](https://darksky.net/dev/docs/forecast) provides a lot of information, but we're only going to track and store the most common information people are typically interested in.

![Device Settings](/images/getting-started/walkthrough/device-settings.png "Device Settings")

When creating the device, make sure `Standalone` is selected as the device type. The `Device Attributes` are important. These are what tell Losant what data this device will be reporting and what Losant will be storing. For the weather device, we'll be storing the following attributes:

* `dew-point` - the dew point in degrees Fahrenheit.
* `feels-like` - the apparent temperature with wind chill and humidity accounted for.
* `humidity` - the relative humidity between 0-1.
* `pressure` - the sea-level air pressure in millibars.
* `temp` - the temperature in degrees Fahrenheit.
* `visibility` - the average visibility in miles.
* `wind-speed` - the wind speed in miles per hour.

Once all the attributes are properly defined, click the `Create Device` button at the bottom of the page.

## Step 4: Requesting Weather Data

In this step, we're going to use a [Losant workflow](/workflows/overview/) to periodically request weather data from Dark Sky and store it on our new device.

Create a new workflow from the `Workflows` main menu:

![Create Workflow](/images/getting-started/walkthrough/create-workflow.png "Create Workflow")

Choose `Create Cloud Workflow` on the following screen, since we want to create from a [cloud](/workflows/cloud-workflow/) workflow. Name the workflow anything you like and provide an optional description.

![Workflow Settings](/images/getting-started/walkthrough/workflow-settings.png "Workflow Settings")

### Timer Trigger

All workflows start with a trigger. For this example, we simply want this workflow to run every couple of minutes and grab weather data. Drag a [Timer Trigger](/workflows/triggers/timer/) onto the workflow canvas.

![Timer Trigger](/images/getting-started/walkthrough/timer-trigger.png "Timer Trigger")

Once it's added to the canvas, set the interval to every 2 minutes. Dark Sky provides us with 1,000 API requests per day. Requesting every 2 minutes will use 720 of those.

### Requesting Data

You'll see a few extra nodes on the below workflow. The `Virtual Button` node was added so you can easily trigger this workflow without having to wait for the timer. The `Debug` node prints out the payload that was received from the `HTTP` node. We'll use these so we can test this workflow to ensure it's working correctly. Drag all of these nodes onto the canvas and connect them as shown below.

![HTTP Node](/images/getting-started/walkthrough/http-node.png "HTTP Node")

Click the HTTP node to configure it. There are two important configuration options for the HTTP node. The first is the URL and the second is where to store the result. The URL will be Dark Sky's API endpoint:

```text
https://api.darksky.net/forecast/APIKEY/LATITUDE,LONGITUDE
```

The `APIKEY` should be replaced by the key you obtained in step 1 after registering for Dark Sky. The `LATITUDE` and `LONGITUDE` are the coordinates, in decimal degrees, of the location to request. <a href="http://mygeoposition.com" target="_blank">MyGeoPosition.com</a> is a neat tool to get these coordinates if you don't have them handy. Here's the coordinates of Losant's headquarters if you'd like to use these:

```text
https://api.darksky.net/forecast/APIKEY/39.1119359,-84.51254
```

The second required configuration parameter for this HTTP node is the location on the payload to put the result. Workflows work by passing a payload through each node in the workflow. Nodes can add, remove, or modify the payload as needed as it flows through them. In this case, we're going to add a `weather` field to the payload that will hold the response from the Dark Sky API.

Deploy the workflow now and we can inspect the payload using the debug node.

![Deploy Workflow](/images/getting-started/walkthrough/deploy-workflow.png "Deploy Workflow")

You can now wait 2 minutes for the timer to fire, or simply click the virtual button to trigger the workflow. Once triggered, click the debug tab at the bottom of the properties panel to see the output.

![Debug Output](/images/getting-started/walkthrough/debug-output.png "Debug Output")

We can now inspect our payload and can see the result from the Dark Sky API call has been placed on the `weather` field of the payload.

![Payload](/images/getting-started/walkthrough/payload.png "Payload")

## Step 5: Save Weather Data to Device

Now that we've got weather data being queried every 2 minutes, it's time to start storing it on our device. Drag a device state node onto the canvas and connect it to the the HTTP node.

![Device State](/images/getting-started/walkthrough/device-state.png "Device State")

The device state node requires you to select the device to report as - which in this case is the device you created earlier. We then set the devices state by publishing values for all of the attributes we defined for the device earlier. The values support what Losant calls templates, which means we can reference data stored on the payload. As you saw from the debug output earlier, the payload currently looks something like this:

```json
{
  "time": "2017-06-16T18:12:13.000Z",
  "data": {},
  "applicationId": "5943e1fe70f8bc0007fcae80",
  "triggerId": "5943e39c70f8bc0007fcae84-Sy6NhcWmZ",
  "triggerType": "timer",
  "relayId": "5943e39c70f8bc0007fcae84-Sy6NhcWmZ",
  "relayType": "timer",
  "flowVersion": "develop",
  "flowId": "5943e39c70f8bc0007fcae84",
  "flowName": "Weather Grabber",
  "applicationName": "Weather Station",
  "globals": {},
  "weather": {
    "body": {
      "latitude": 39.1119359,
      "longitude": -84.51254,
      "timezone": "America/New_York",
      "offset": -4,
      "currently": {
        "time": 1497636733,
        "summary": "Clear",
        "icon": "clear-day",
        "nearestStormDistance": 46,
        "nearestStormBearing": 157,
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 86.2,
        "apparentTemperature": 89.15,
        "dewPoint": 63.87,
        "humidity": 0.47,
        "windSpeed": 3.14,
        "windGust": 4.82,
        "windBearing": 79,
        "visibility": 10,
        "cloudCover": 0.11,
        "pressure": 1010.27,
        "ozone": 299.14,
        "uvIndex": 11
      },
      ...
    },
    ...
  }
}
```

To pull the value of the temperature out of this payload, we would use the following template:

```handlebars
{{ weather.body.currently.temperature }}
```

We can then assign values to our various attributes by using the following templates:

* dew-point : `{{ weather.body.currently.dewPoint }}`
* feels-like : `{{ weather.body.currently.apparentTemperature }}`
* humidity : `{{ weather.body.currently.humidity }}`
* pressure : `{{ weather.body.currently.pressure }}`
* temp : `{{ weather.body.currently.temperature }}`
* visibility : `{{ weather.body.currently.visibility }}`
* wind-speed : `{{ weather.body.currently.windSpeed }}`

You can now deploy this workflow and every time the timer triggers, the device state node will publish those state attributes to your device in Losant.

![Deploy Workflow](/images/getting-started/walkthrough/deploy-workflow.png "Deploy Workflow")

You can verify the device is properly reporting state by inspecting the recent device states in the debug section of your device page. Your device will be available in the `Devices` menu under the `Recent Devices` section.

![Recent States](/images/getting-started/walkthrough/recent-states.png "Recent States")

## Step 6: Create a Dashboard

Now that we've got weather data being stored, we can start to visualize it using Losant's [dashboarding tools](/dashboards/overview/). Create a new dashboard using the `Dashboard` main menu. You can name it whatever you like.

![Create Dashboard](/images/getting-started/walkthrough/create-dashboard.png "Create Dashboard")

The first block to add is a simple gauge to show the current temperature.

![Add Gauge](/images/getting-started/walkthrough/add-gauge.png "Add Gauge")

![Gauge Settings](/images/getting-started/walkthrough/gauge-settings.png "Gauge Settings")

Set the block title to "Temperature" and select your application from the application dropdown. The gauge has two ways to display itself. One is a simple number, which is what you'll want for this, and the other is a dial. Select `Number Gauge`.

Set the duration to `Last received data point`. Gauges can also display aggregates over time. So if you were to select a time range, a new field would appear in the block data section where you could specify how to aggregate the data. For example, you could display the average temperature over the last 24 hours.

For the block data, set the label to ˚F, which is an arbitrary string that will appear under the number. Typically this would be the units for the data being displayed. Select the device you created earlier and set the attribute to `temp`. The attributes correspond to the attributes we defined for our device and the attributes that the workflow is currently populating with weather data.

What this does is pull the most recently received value for the temp attribute from the device and displays it on the dashboard. Click `Add Block` to view it on your new dashboard.

![Temp Gauge](/images/getting-started/walkthrough/dashboard-with-temp-gauge.png "Temp Gauge")

Next, let's add another gauge to show the humidity. Add a new gauge block using the `Add Block` button at the top of the dashboard. Follow the same steps as before, but this time select the Dial block type instead of Number.

![Add Block Button](/images/getting-started/walkthrough/add-block-button.png "Add Block Button")

![Add Gauge](/images/getting-started/walkthrough/add-gauge.png "Add Gauge")

![Humidity Gauge Settings](/images/getting-started/walkthrough/humidity-gauge-settings.png "Humidity Gauge Settings")

Humidity is returned from Dark Sky as a number between 0 and 1, so we need to set the minimum and maximum values of the dial gauge to those, and check "Display as Percentage" since humidity is a percentage. The only other change is to use the humidity attribute instead of the temp attribute in the data section. Once done, click `Add Block` to see your new gauge.

![Humidity Gauge](/images/getting-started/walkthrough/dashboard-with-humidity.png "Humidity Gauge")

Now let's make some space for a nice big linear graph that we'll add next. Drag the humidity gauge underneath the temperature gauge.

![Dashboard Drag](/images/getting-started/walkthrough/dashboard-drag.gif "Dashboard Drag")

Next, let's add a graph that displays temperature vs. humidity over time. Click the `Add Block` button and add a `Time Series Graph` block.

![Time Series Basic Settings](/images/getting-started/walkthrough/time-series-settings-1.png "Time Series Basic Settings")

The [time series graph](/dashboards/time-series-graph/) requires you to select a duration and a resolution. The duration is how far back in time you'd like to view. Since you don't have much data yet, select 60 minutes. As your device continues to collect weather data, you can increase this to view longer time periods if needed.

The resolution is how far apart individual data points are. Select one minute for this example, which means you'll see a data point for every minute. Resolution works closely with the aggregator in the block data section. If you're collecting data more often than the resolution, it will be aggregated by the method you specify. This example will take the average of all data points each minute and graph the result.

![Time Series Temperature"](/images/getting-started/walkthrough/time-series-settings-2.png "Time Series Temperature")

Unlike the gauge, which can only display a single value, time series graphs can display multiple series. In this example we want to display two: one for the temperature and one for the humidity. After configuring the first series to display temperature, like above, click the "Add Segment" button to add a second configuration block for humidity.

![Time Series Humidity](/images/getting-started/walkthrough/time-series-settings-3.png "Time Series Humidity")

Configure the second series to display humidity, click `Add Block` to add this new block to the dashboard. You now have a graph that displays temperature and humidity over the last 60 minutes.

![Time Series Graph](/images/getting-started/walkthrough/dashboard-with-graph.png "Time Series Graph")

Resize the graph to fill the available dashboard space.

![Dashboard Resize](/images/getting-started/walkthrough/dashboard-resize.gif "Dashboard Resize")

The remainder of the dashboard is left as a challenge for you.

![Full Dashboard](/images/getting-started/walkthrough/dashboard-full.png "Full Dashboard")

The above dashboard adds the following blocks:

1. Pressure number gauge using the `pressure` attribute.
1. Wind Speed number gauge using the `wind-speed` attribute.
1. Pressure graph showing the `pressure` attribute over the last 60 minutes.
1. Visibility number gauge using the `visibility` attribute.
1. Dew point number gauge using the `dew-point` attribute.

All of these blocks can be added using the same steps as above but with different attributes for the data source.

Once complete, you now have a pretty capable local weather dashboard for viewing the current and historical weather data. As an additional challenge, see if you can use another workflow to setup SMS notifications when the temperature goes above or below certain values.
