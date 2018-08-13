# Data Visualization Workshop

![Workshop Image](/images/university/workshop.jpg)

## Introduction

Welcome to your workshop on data visualization! This workshop is meant to give you real, step-by-step instructions on how to accomplish and use most of the tools we covered throughout the course.

This workshop builds on the [Course Three Workshop](/university/course-three-workshop/) and will guide you through [building dashboard blocks](/dashboards/overview/) and the use of [context variables](/dashboards/context-variables/).

Let’s begin.

## The Story

First, recall the story of the application we are building:

<blockquote>
<p>Embree is launching an initiative to adopt IoT and offer new capabilities to their customers. Currently, Embree produces water pumps for industrial use cases like mining, construction, and oil & gas. Their goal is to gain deeper insight into the pumps and provide more value to their customers. </p>

<p>To begin the new initiative, the Embree team decided to start with a proof-of-concept, which will enable them to solve a small, useful problem to get results faster. For this first project, Embree wants to take one of their existing pumps and send the data it’s collecting, like flow rate and temperature, to the cloud.  </p>

<p>To build this proof-of-concept, they chose to use Losant. They chose Losant because the user experience would allow them build this proof-of-concept in no time and they could easily build new applications with the insights gained.</p>
</blockquote>

Currently in our application, we already have a device that represents our water pump with the following attributes:

- Battery Voltage
- Valve Status
- Flow (liters per second)
- Temperature
- RPM

To visualize data in the last workshop we used the [Data Explorer](/applications/data-explorer/):

![Data Explorer](/images/university/course-three-workshop/device-explorer-graph.png)

The Data Explorer is great if we want to quickly look and analyze data. But, creating a dashboard provides more features like different visualizations, [reporting](/dashboards/overview/#email-reports), [sharing](/dashboards/overview/#dashboard-access-control) etc.

Before we can create a dashboard, we need some data.

## Part One: Building the Dashboard

### Simulate Data

Open up the [Device Simulator](/devices/simulator/). If you open up the device page, on the left side, you'll see the simulator.

![Device Simulator](/images/university/course-three-workshop/device-simulator-navigation.png)

Next, set the simulator to generate random values for all of our attributes. To help you follow along, please use the following values:

![Device Simulator](/images/university/course-three-workshop/device-simulator-random.png)

**Remember, the simulator is using your browser window as the device. So, you must leave this browser window open for your device to simulate data.**

Now that we have a device that’s generating data, **open up a new tab** and let’s create a dashboard.

### Create a Dashboard

We provide many visualizations to best show your data for the questions you are asking about your data. For this example, here is what we can do:

Voltage, flow and temperature can be represented with a [Time Series Graph](/dashboards/time-series-graph/); mostly because we want to see changes in the data over time.

![Time Series Graph](/images/university/course-four-workshop/time-series-complete.png)

RPM can be represented with a [Gauge Block](/dashboards/gauge/); mostly because we are concerned with its current value within a range.

![Gauge Block](/images/university/course-four-workshop/gauge-preview.png)

Valve status can represented with a [Indicator Block](/dashboards/indicator/). We want to use this block because we can create a visualization to show us the current status of the valve and a corresponding background color (green for on and red for off) to clearly see the status of the valve.

![Indicator Block](/images/university/course-four-workshop/indicator-preview-bad.png)

To get started, let’s add our Time Series Graph.

### Adding a Time Series Graph

On the “Add Block” page, click the Time Series Graph.

![Time Series Graph Add Block](/images/university/course-four-workshop/time-series-block.png)

First, we must give our block a name and choose our application. This application needs to be the application that contains our pump device.

Next, let’s set our block to be “Historical” and the duration and resolution to “15 minutes” and “1 minute” respectively.

![Time Series Graph Settings](/images/university/course-four-workshop/time-series-settings.png)

The simulator is set to generate data every two seconds. So, by choosing a resolution of one minute, each data point on the block will represent an aggregated value of 30 data points (data will be reported 30 times, or every 2 seconds, within a 1 minute interval). We will have the option to select the aggregation method below.

Next, configure the device data.

![Time Series Graph Block Data Settings](/images/university/course-four-workshop/time-series-settings-two.png)

1. Choose the “Water Pump” device.
2. Select an attribute. In the screenshot above, I chose flow.
3. Set the “Series Label” to “Flow”.
4. Set the aggregation to “MEAN”.

Because we chose “MEAN”, each data point on the graph will represent the average of the 30 points we talked about previously.

Now, we should see data appearing in the preview:

![Time Series Graph Preview](/images/university/course-four-workshop/time-series-preview.png)

### Time Series Graph Exercise:

We wanted this block to display voltage, flow and temperature. Using the “Add Segment” button, add voltage and temperate to this graph.

Once done, you should have a block that looks similar to this:

![Completed Time Series Graph](/images/university/course-four-workshop/time-series-complete.png)

After completing the exercise, add the block to the dashboard.

Next, let’s add a Gauge Block to display the RPM of the water pump.

### Adding a Gauge Block

On the “Add Block” page, click the Gauge Block:

![Gauge Block Add](/images/university/course-four-workshop/gauge-block.png)

First, we must give our block a name and choose our application.

Since we are concerned with it’s current value within a range, this is a perfect use case for the “Live Stream” type. With this type, the block on the dashboard will just reflect a live stream of data coming in.

For our Gauge type, let’s choose a Dial Gauge, a min of 2000, and a max of 3000. These numbers are the same min and max we choose in the simulator.

![Gauge Settings](/images/university/course-four-workshop/gauge-settings.png)

Now, on to our block data:

![Gauge Block Data Settings](/images/university/course-four-workshop/gauge-data-settings.png)

1. Choose “Water Pump” as your device.
2. Set “Label” to “RPM”.
3. Choose the “rpm” attribute.

Once done, our preview should appear:

![Gauge Block Preview](/images/university/course-four-workshop/gauge-preview.png)

### Gauge Block Exercise:

The Gauge block can change colors based on its current represented value. Let’s say, for our water pump, the RPM should never reach above 2500 rpm. If it does, our dashboard should reflect that, like so:

![Gauge Preview Conditional](/images/university/course-four-workshop/gauge-preview-conditional.png)

Using the "Conditional Colors", create a conditional to implement this functionality into the block. Once done, if the RPM goes above 2500, you should see a block that looks like the screenshot above.

After completing the exercise, add the block to the dashboard.

Next, we can add a Indicator Block to reflect our valve status.

### Adding an Indicator Block

On the “Add Block” page, click the Indicator Block:

![Indicator Block Add](/images/university/course-four-workshop/indicator-block.png)

Here, we want to make the data type of this block a “Live Stream”. This will ensure that our dashboard always displays the most recent status of the valve.

We also need to define the block data:

1. Choose “Water Pump” as your device.
2. Choose the “valve-status” attribute.

As you may recall from the video, this will create two variables for us to use later: `value-0` and `time-0`.

![Indicator Block Device Settings](/images/university/course-four-workshop/indicator-device.png)

If the valve is open, we want to display a green background color and the text “open”. In order to do this, we need to check to see if the valve status is set to `true`. We can use a conditional to check this.

In the conditional, we can check for `{{ value-0 }} == true` (is the status of the value true, or open). If it is, it will display the label and color we define here:

![Indicator Block Query Settings](/images/university/course-four-workshop/indicator-query.png)

Once done, in the preview to the right, when the valve is reporting as open, we can see this:

![Indicator Block Preview Good](/images/university/course-four-workshop/indicator-preview.png)

**Exercise:**
If the valve is closed, let’s do the exact opposite. Create the conditional to cause the Indicator Block to be red and display “closed” when the status is `false`.

![Indicator Block Preview Bad](/images/university/course-four-workshop/indicator-preview-bad.png)

After completing the exercise, add the block to the dashboard.

### Complete

Now, our dashboard is complete! If all went well, we should have something that looks like this:

![Complete Dashboard](/images/university/course-four-workshop/dashboard-complete-one.png)

## Part Two: Context Variables

Currently we only have one device and one dashboard. But, what if we have multiple devices? As you may recall from the videos, we don’t want to create a dashboard for each device, we can use [context variables](/dashboards/context-variables/) to make this dashboard reusable.

### More Devices

Now, we are going to create a reusable dashboard. But first, we need a new device. If you go to your current device settings, you can clone your device.

![Clone Device](/images/university/course-four-workshop/clone-device.png)

Also, to make our devices more easily identifiable, let’s rename the devices to “Water Pump 0” and “Water Pump 1”.

![Rename Water Pump](/images/university/course-four-workshop/water-pump-rename.png)

Before we change our dashboard, our new device needs to be reporting data to Losant. To do so, we can use the simulator.

### Simulate Extra Device Exercise:

Your task is simple: simulate data for “Water Pump 1” (the newly created device).

**Remember, the simulator is using your browser window as the device. So, you must leave this browser window open for your device to simulate data. This means you should have two independent tabs at this point generating data.**

Next, we can add a Device List Block to the dashboard to display a list of all of our devices.

### Add a Device list Block

On the “Add Block” page, choose the Device List Block:

![Device List Block Add](/images/university/course-four-workshop/device-list.png)

In the block settings, we can optionally choose to filter our devices, or if we don’t filter, the list will include all of our devices. Since we only have two devices, we can leave this blank.

The items in the list can be a link. We will change this later, but for now, just leave it as a link to the device page.

![Device List Block Settings](/images/university/course-four-workshop/device-list-settings.png)

Here is what your preview should look like:

![Device List Block Preview](/images/university/course-four-workshop/device-list-preview.png)

Let’s also add this block to our dashboard:

![Dashboard Complete](/images/university/course-four-workshop/dashboard-complete-two.png)

**Adding Context**
If you choose our dashboard settings, in the window, we can select “Add Context”.

![Add Context Variables](/images/university/course-four-workshop/add-context-vars.png)

Let’s create some context variables. First, let’s create a context variable for `deviceId`.

![Device ID Context Variable](/images/university/course-four-workshop/deviceid-context-var.png)

1. Name the variable “deviceId”
2. Choose the proper application
3. Set “Water Pump 0” as the default value.

Next, create a context variable for the name of the device. This will be helpful later to see the name of the device we are currently viewing.

![Name Context Variable](/images/university/course-four-workshop/name-context-var.png)

Save the variables, now let’s use them.

**Update the Time Series Graph**
Now that we have some context variables, let’s update the Time Series Graph to use the `deviceId` context variable.

Choose “Edit Settings” in the block settings:

![Time Series Block Settings](/images/university/course-four-workshop/edit-time-series-block.png)

Next, update the block data to use the context variable `{{ctx.deviceId}}` instead of the individual device:

![Time Series Context](/images/university/course-four-workshop/time-series-context.png)

This tells the block to use the context of the dashboard as the device. So, we can switch the context of the dashboard, and our blocks will update as well.

Time Series Context Variable Exercise:
Update the other segments of the block to use the `deviceId` context.

### Changing Context

Let’s save this block and go back to the dashboard:

![Complete Dashboard](/images/university/course-four-workshop/dashboard-complete-two.png)

Notice one thing, it (more specifically the Time Series Block) looks the same! This is because, since we haven’t provided a context yet, our dashboard is using the default value we input into the context variable settings.

To change the context, take a look at the dashboard settings:

![Context Variable Settings](/images/university/course-four-workshop/context-settings.png)

There, we can see two new fields. Change the `deviceId` context using the dropdown and see what happens.

The Time Series Graph should change to reflect the new device. Our other blocks aren’t updating because they are not using the `deviceId` context variable yet.

### Context Variable Exercise:

Update all the blocks (except for the Device List Block) to use the `deviceId` context variable.

Once done, let’s update the Device List Block.

### Update Device List Block

If you recall, we can have the items in the Device List block link to a custom URL. We can use this feature to have the items in this list link to their own dashboard with the appropriate context. When you change the context of the dashboard, Losant appends the URL with query data that represents the context:

    ?ctx[deviceId]=5b5f8c5796a6a400067a2046

Taking advantage of this, we can configure the context of the dashboard based on a link in the device list block (instead of using the settings button each time).

Open your Device List Block settings:

![Device List Block Custom URL](/images/university/course-four-workshop/context-url.png)

Choose “Link to a custom URL”.

Here you want to paste in your dashboard URL and append the context variables like so:

    https://app.losant.com/dashboards/5b5f8c5796a6a400067a2046?ctx[deviceId]={{ deviceId }}&ctx[name]={{ deviceName }}

**Make sure you change** `https://app.losant.com/dashboards/5b5f8c5796a6a400067a2046` **to the link of your dashboard.**

In the link above, we see `{{ deviceId }}` and `{{ deviceName }}`. These are special variables that the Device List Block provides (take a look at the “Device Link” section’s description).

So, in the Device List Block, our links will render like so:

    https://app.losant.com/dashboards/5b5f8c5796a6a400067a2046?ctx[deviceId]=5b5f8b56be662f000794d3a3&ctx[name]=Water Pump 0

Now, save your block with your new custom URL.

![Device List Block Preview](/images/university/course-four-workshop/device-list-preview.png)

It will look exactly the same, but when you click the name of the pump, you will be taken to a dashboard with the context of this device!

### Add Section Header

We haven’t used our `name` context yet. Let’s use it in a Section Header Block to display the name of the device we are currently looking at.

Here are the block settings for the Section Header Block:

![Section Block Settings](/images/university/course-four-workshop/header-settings.png)

Set the title to `{{ctx.name}}`.

In the preview, you should see it update with our default device.

### All done

Now, we can add hundreds and thousands of pumps and each will have their own dashboard. Better yet, this dashboard never has to change to accommodate all of our new pumps.

![Final Complete Dashboard](/images/university/course-four-workshop/water-pump-context-variables.gif)

## What's next?

Congratulations, you are now officially done with Course 4 of Losant University!

Feel free to poke around Losant; there is a ton to explore. If you run into any troubles along the way, the [Documentation](https://docs.losant.com/) and [Forums](https://forums.losant.com/) are there to help.
