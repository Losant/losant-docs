---
description: Become a Losant expert with Losant University. This is the Course Five Workshop on Visual Workflow Engine.
---

# Workflow Engine Workshop

![Workshop Image](/images/university/workshop.jpg)

## Introduction

Welcome to your workshop on the Workflow Engine! The purpose of this workshop is to give you real, step-by-step instructions on how to accomplish and use most of the tools we covered throughout the course.

This workshop builds on the [Course Four Workshop](https://docs.losant.com/university/course-four-workshop) and will guide you through creating workflows and illustrate how to use advanced workflow features.

Let’s begin.

## The Story

First, let’s recall the story of the application we are building:

> Embree is launching an initiative to adopt IoT and offer new capabilities to their customers. Currently, Embree produces water pumps for industrial use cases like mining, construction, and oil & gas. Their goal is to gain deeper insight into the pumps and provide more value to their customers.
>
> To begin the new initiative, the Embree team decided to start with a proof of concept, which will enable them to solve a small, useful problem to get results faster. For this first project, Embree wants to take one of their existing pumps and send the data it’s collecting, like flow rate and temperature, to the cloud.  
>
> To build this proof of concept, they chose to use Losant. They chose Losant because the user experience would allow them build this proof of concept in no time and they could easily build new applications with the insights gained.  

In Course Three, we created a device that represents our water pump with the following attributes:

- Battery Voltage
- Valve Status
- Flow (liters per second)
- Temperature
- RPM

Then, we simulated the data and did a simple analysis using the Data Explorer:

![Data Explorer](/images/university/course-three-workshop/device-explorer-graph.png)

In Course Four, we took a look at different visualizations, [reporting](https://docs.losant.com/dashboards/overview/#email-reports), [sharing](https://docs.losant.com/dashboards/overview/#dashboard-access-control), and all the dashboarding features in Losant. In the workshop, we created a dashboard that supports Context Variables, which allows us to add hundreds and thousands of pumps and each had have their own dashboard.

![Final Complete Dashboard](/images/university/course-four-workshop/water-pump-context-variables.gif)

Now that we’ve covered Workflows, we can take our application to the next level! In this workshop we are going to:

- Use the Workflow Engine to simulate device data permanently.
- Configure an Input Control Block to trigger a workflow.
- Use the Workflow Engine to email an alert when a devices’ state is out of range.

Let’s begin.

## Part One: Simulate Devices

The Device Simulator is excellent, but its one limitation is that you need to keep the browser window open to simulate devices. Lucky for us, we can use the Workflow Engine to always simulate data without the simulator. This ensures, from here on out, you’ll always have device data within your application.

First, let’s create a workflow. You can create a workflow by going to “Create Workflow” in the Workflows dropdown menu.

![Create Workflow](/images/university/course-five-workshop/create-workflow.png)

Be sure to create an Application Workflow:

![Application Vs Edge](/images/university/course-five-workshop/application-vs-edge.png)

Next, you can give the new workflow a name and description:

![Workflow Name and Description](/images/university/course-five-workshop/workflow-name-description.png)

Now, that you are at the in the Workflow Canvas, it’s time to start building! Here is the workflow we are going to build to simulate data:

![Simulator Workflow](/images/university/course-five-workshop/simulator-workflow.png)

The goal of this workflow is to, on an interval, generate a random number that represents temperature, and report the temperature state to `Water Pump 0`. To do this we need the following nodes:

- [Timer Trigger Node](https://docs.losant.com/workflows/triggers/timer/) - to trigger based on an interval
- [Random Number Node](https://docs.losant.com/workflows/logic/random-number/) - to generate a random number
- [Device State Node](https://docs.losant.com/devices/state/) - to report state
- [Debug Node](https://docs.losant.com/workflows/outputs/debug/) - to inspect the payload

Let’s walk through each node configuration.

### Timer Node

Our simulator ran every two seconds. So, we can configure the Timer Node to do the same:

![Timer Node Settings](/images/university/course-five-workshop/timer-node-settings.png)

Timer Node Configuration:

- Schedule Type: Simple Interval
- Run Once Every: 2
- Time Unit: Seconds

### Random Node

The Random Number Node generates a random whole number within a range of your choosing and stores the number in the payload for use by subsequent nodes.

![Random Node Settings](/images/university/course-five-workshop/random-node-settings.png)

Random Node Configuration:

- Minimum Value: `60`
- Maximum Value: `90`
- Result path: `working.temp`

If you would like to simulate different values, feel free to update these to your liking.

One key thing to notice here is the “Result Path”. This is where the Random Node will place the random value it generates, so that you can use it later.

![Random Node Payload Example](/images/university/course-five-workshop/random-node-payload-example.png)

### Device State Node

Lastly, we need to configure the Device State Node to tell it which attribute we would like to report our random data to.

First, we need to select a device:

![Device State Node Settings](/images/university/course-five-workshop/device-state-node-settings.png)

Next, we need to update the `temp` attribute value:

![Device State Node Settings](/images/university/course-five-workshop/device-state-node-settings-two.png)

These value fields are templateable. We know this because the curly bracket is used in the input example. Under the `temperature` attribute, we need to set the value to:

```handlebars
{{ working.temp }}
```

So, when this workflow runs, it will report our randomly generated number as state for our device.

### Save and Deploy

![Save and Deploy](/images/university/course-five-workshop/save-and-deploy.png)

Now that our workflow is running, we will immediately be able to see the debug message appear every two seconds, and if you take a look at `working.temp` you’ll find the random data.

![Running Workflow](/images/university/course-five-workshop/running-workflow.gif)

Also, if you take a look at your [device properties page](https://app.losant.com/applications/recent/devices/recent/properties), you can see the state messages appear in the Device Log:

![Device Log](/images/university/course-five-workshop/device-debug-log.png)

### Exercise

For this exercise, you have two tasks:

1. In your workflow, simulate data for the following attributes:

- flow
- rpm
- voltage

1. Since we have two water pumps, simulate data for the second as well.

Feel free to come up with your own values that makes sense. However, for reference, here is what we were doing with the simulator:

![Device Simulator](/images/university/course-three-workshop/device-simulator-random.png)

If you need some guidance, here is what my completed workflow looks like:

![Completed simulated workflow](/images/university/course-five-workshop/completed-simulated-workflow.png)

Now, notice we did not simulate the value status. Let’s do that.

## Part Two: Simulate Value Status

In the [Input Control Block Chapter in Course Four](https://www.losant.com/university/lessons/course-4-chapter-7-input-control-block), we talked about how you can trigger actions from a dashboard, such as triggering workflows. When triggering a workflow from an Input Control Block, behind the scenes you are triggering a Virtual Button. For our use case, we can use the Input Control Block to open and close the water pump valve.

![Valve Control](/images/university/course-five-workshop/valve-control.gif)

Let’s build this.

### Workflow

Before we can build an Input Control Block to trigger a Virtual Button, we need to create the Virtual Button to trigger.

In our Water Pump Simulator workflow, let’s add a new workflow path:

![Simulated workflow new path](/images/university/course-five-workshop/simulated-workflow-new-path.png)

This new path consists of:

- [Virtual Button Trigger](https://docs.losant.com/workflows/triggers/virtual-button/) - to trigger using a button
- [Device State Node](https://docs.losant.com/devices/state/) - to report valve state
- [Debug Node](https://docs.losant.com/workflows/outputs/debug/) - to inspect the payload

We don’t need to do any configuration for the Virtual Button or Debug Node. Let’s configure the Device State Node:

![Device State Node Settings](/images/university/course-five-workshop/device-state-node-settings-three.png)

For the device, we want to specify a “Device ID JSON Path” of:

```text
data.deviceID
```

Later on, we are going to configure the Input Control Block to pass this data to the Virtual Button so we can make use of it here.

We also want to configure the `valve-status` attribute:

- Attribute: `valve-status`
- Value: `{{ data.valve}}`

Just as `data.deviceID`, `data.value` will come from the Input Control Block.

### Input Control Block

In order for everything to work properly, our Input Control Block needs to trigger the Virtual Button we just created. However, when it triggers the Virtual Button, we need it to send along the `deviceId` of the device to control, and the `valve-status` to change to. We’ve set up our button to accept this, now we need the Input Control Block to send this data. Let’s configure it.

Add an Input Control Block to the dashboard:

![Add Input Control Block ](/images/university/course-five-workshop/add-input-control-block.png)

![Add Input Control Block Two](/images/university/course-five-workshop/add-input-control-block-two.png)

Next, configure the name, description, and application.

Then, add two button controls. One to represent “Open Valve” and the other “Close Valve”.

![Input Control Block Settings](/images/university/course-five-workshop/input-control-block-settings.png)

Here is the block configuration:

- Label: `Open Valve`
- Color: Green
- On Click: Trigger Workflow
- Workflow: Select your workflow that contains the Virtual Button we created earlier.
- Virtual Button: Select the appropriate Virtual Button in the respective workflow.
- Payload:

```json
{
  "deviceId": "{{ctx.deviceId}}",
  "valve": true
}
```

With this configuration, we are tying the input control button to the Virtual Button on the workflow. When triggering the Virtual Button, the Input Control Block will use the contents of the “Payload” configuration as the data of the Virtual Button. In this case, it will send a `deviceId` and `valve`. These values correspond to the data we expect in the Device State Output Node in our workflow.

Another thing: Our dashboard supports [Context Variables](https://docs.losant.com/dashboards/context-variables/). Since we have access to these variables within the block settings, we can use `{{ctx.deviceId}}` as the Device ID. So, no matter the device, my Input Control Block is flexible enough to know what device I want to control.

### Exercise Two

Since we didn’t walk through this one, configure the “Close Value” input control button.

Once done, and because we also have a Live Stream Indicator Block (bottom left), we can see the value status update in real time:

![Valve Control](/images/university/course-five-workshop/valve-control.gif)

## Part Three: Alerting

When Embree started down this path, the goal was to take one of their existing pumps and send the data it’s collecting, like flow rate and temperature, to the cloud. The natural progression of this problem is to be alerted when any of the pump telemetry data goes out of a range.

Because we are solving a different problem, let’s create a new workflow:

![Create Workflow](/images/university/course-five-workshop/create-workflow-two.png)

![Valve Workflow](/images/university/course-five-workshop/valve-workflow.png)

This new workflow consists of:

- [Device: State Trigger](https://docs.losant.com/workflows/triggers/device/) - to trigger the workflow when our device sends data
- [Latch Node](https://docs.losant.com/workflows/logic/latch/) - to do one-time branching to check our alert
- [Email Node](https://docs.losant.com/workflows/outputs/email/) - to send an email
- [Debug Node](https://docs.losant.com/workflows/outputs/debug/) - to inspect the payload

Let’s configure them:

### Device State Trigger

The Device: State Trigger allows us to trigger this workflow when our water pump reports state. Because we have another workflow simulating data every two seconds, we can listen for state.

In the configuration, all we need to do is select our device(s);

![Device State Trigger Settings](/images/university/course-five-workshop/device-state-trigger-settings.png)

For simplicity, I just chose one water pump.

### Latch Node

Recall that the Latch Node allows us to do one-time branching. Instead of evaluating an expression every time—like the Conditional Node—if our expression results to true, the latch node will "latch" to false. So, once it detects our threshold warning and sends the email, the node will latch to false and we won't continue to get emails. If we were to use the Conditional Node here, we would get an email every time our device reports — this is currently every two seconds.

Let’s configure this node:

![Latch Node Settings](/images/university/course-five-workshop/latch-node-settings.png)

Here is the configuration:

Latch Expression:

```handlebars
{{ data.temperature }} > 90
```

Reset Expression:

```handlebars
{{ data.temperature }} <> 90
```

Here, we are checking if our temperature is above 90 degrees. If this were to happen, the Latch Node will only take the `true` path (right) once — until the reset conditional is true, thereby resetting the 'latch'. We only want to reset the latch when our device is back to “normal” or under 90 degrees.

### Email Node

Now we just have to configure the email:

![Email Node Settings](/images/university/course-five-workshop/email-node-settings.png)

Here is the configuration:

- To Address - Your email
- From Address - Your email
- Email Subject - `Water Pump Alert`
- Email Body -

```handlebars
{{ deviceName }} has reached a critical temperature of {{ data.temperature }} degrees Fahrenheit.
```

### Testing

If you would like to test this workflow out in different scenarios, you can simply [force a state](http://app.losant.com/applications/recent/devices/recent/debug) [update](http://app.losant.com/applications/recent/devices/recent/debug) in Losant:

![Force Device State](/images/university/course-five-workshop/force-device-state.png)

If you report a state of above 90 degrees, you’ll get an email that looks like this:

![Water Pump Alert](/images/university/course-five-workshop/pump-alert.png)

## All done

Now, we are beginning to have a more complete application on our hands.

- Use the Workflow Engine to simulate device data permanently
- Configure an Input Control Block to trigger a workflow.
- Use the Workflow Engine to email an alert when a devices’ state is out of range.

### More to Explore

If you already have problems that you would like to try out, please do! There is a ton more you can do with your application. Here are a few examples:

### Custom Nodes

If we added a new water pump, we would have to copy/paste and adjust all the Random Number nodes; this could get messy. However, since you know your device and how you would like to randomly generate data, you could easily build a “Water Pump Simulator” random node that can do this workflow you.

![Custom Nodes](/images/university/course-five-workshop/custom-nodes.png)

### Connect to External API

In this workshop, we didn’t bring in any external data. Try bringing weather data into our application, and build a dashboard around it. There is already complete instructions on how to do this in the [Losant Walkthrough](https://docs.losant.com/getting-started/walkthrough/).

![Weather Dashboard](/images/getting-started/walkthrough/dashboard-full.png)

## What's Next?

Congratulations, you are now officially done with Course Five of Losant University!

Feel free to poke around Losant; there is a ton to explore. If you run into any troubles along the way, the [Documentation](https://docs.losant.com/) and [Forums](https://forums.losant.com/) are there to help.
