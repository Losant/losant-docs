---
description: Become a Losant expert with Losant University. This is the Course Six Workshop on the Edge Agent.
---

# Edge Agent Workshop

![Workshop Image](/images/university/workshop.jpg)

## Introduction

Welcome to your workshop on the Edge Agent. The purpose of this workshop to get your hands dirty with the edge agent. In the course, we installed the agent, reviewed usage, and covered some of the edge-specific nodes. Now, let's put some of that to use to our example.

## Review

First, let’s recall the story of the application we are building:

> Embree is launching an initiative to adopt IoT and offer new capabilities to their customers. Currently, Embree produces water pumps for industrial use cases like mining, construction, and oil & gas. Their goal is to gain deeper insight into the pumps and provide more value to their customers.
>
> To begin the new initiative, the Embree team decided to start with a proof of concept, which will enable them to solve a small, useful problem to get results faster. For this first project, Embree wants to take one of their existing pumps and send the data it’s collecting, like flow rate and temperature, to the cloud.  
>
> To build this proof of concept, they chose to use Losant. They chose Losant because the user experience would allow them to build this proof of concept in no time and they could easily build new applications with the insights gained.  

In Course Three, we created a device that represents our water pump with the following attributes:

- Battery Voltage
- Valve Status
- Flow (liters per second)
- Temperature
- RPM

Then, we simulated the data and did a simple analysis using the Data Explorer:

![Data Explorer](/images/university/course-three-workshop/device-explorer-graph.png)

In Course Four, we took a look at different visualizations, [reporting](/dashboards/overview/#email-reports), [sharing](/dashboards/overview/#dashboard-access-control), and all the dashboarding features in Losant. In the workshop, we created a dashboard that supports Context Variables, which allows us to add hundreds and thousands of pumps and each had have their own dashboard.

![Final Complete Dashboard](/images/university/course-four-workshop/water-pump-context-variables.gif)

In Course Five, we used the Workflow Engine to simulate data, trigger alerts, learned to use the Virtual Button Node.

![Completed simulated workflow](/images/university/course-five-workshop/completed-simulated-workflow.png)

## Overview

Now that we’ve covered the Edge Agent, we can make use of it in this application.

<div style="padding:20px; background: #efefef; margin: 10px 0px 10px 0px; border-top: 5px #FF495C solid">
<h2>SIDEBAR</h2>
<p style="margin-bottom:2px;">In the real world, our pump could have a PLC that exposed local Modbus TCP. In that case, we could use the Edge Agent to talk to the pump. However, since we don't have an actual pump with a PLC, we will continue to let the cloud simulate the data and generate other data on the Pi.</p>
</div>

To demonstrate the Edge Agent without the need for additional sensors, we are going to read system memory (RAM) and storage (hard drive space) from the Raspberry Pi.

In this workshop we are going to:

- Use the [Function Node](/workflows/logic/function/) to read the device memory.
- Use the [Run Executable Node](/workflows/data/run-executable/) to read the device storage.

Let’s begin.

## Materials:

This workshop assumes that you are using a [Raspberry Pi](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) as your edge device.

![Raspberry Pi](/images/university/course-six-workshop/raspberrypi.jpg)

If you don't own a Raspberry Pi, remember that the edge agent can be installed on your own computer running MacOS or Windows.

## Part One: Installation and Setup

Before we can begin, we need to install the Edge Agent on our Pi.

Please refer to the installation documentation: [Losant Edge Agent Installation](/edge-compute/edge-agent-installation/).

After you have it installed, we need to get it running: [Losant Edge Agent Usage](/edge-compute/edge-agent-usage/).

**Important**: You will be creating a new device for the edge agent.

Once done, you should be able to run the `docker logs` command:

![Pi Docker Logs](/images/university/course-six-workshop/pi-docker-logs.png)

You should also see your device connected within Losant:

![Connected Edge Device](/images/university/course-six-workshop/connected-edge-device.png)

## Part One: Reading Memory

We are going to use an Edge Workflow to collecting memory information form the Raspberry Pi and save it as device data within Losant. Before we start, we need to add some new attributes to our edge device in Losant:

![New Device Attributes](/images/university/course-six-workshop/new-device-attributes.png)

We are going to add the following:

- `total_memory` - Total memory on the edge device
- `percentage_memory` - Percentage memory used on the edge device
- `free_memory` - Free memory on the edge device
- `used_storage` - Amount of storage used on the edge device
- `total_storage` - Total amount of storage on the edge device

Next, we need to create a new [Edge Workflow](/workflows/edge-workflows/):

![Create New Edge Workflow](/images/university/course-six-workshop/create-new-edge-workflow.png)

Here is the workflow we are going to build to get system memory:

<img src="/images/university/course-six-workshop/get-memory-workflow.png" style="width:200px" />

The goal of this workflow is to, on an interval, get system memory information, and report the state to the edge device. To do this we need the following nodes:

- [Timer Trigger Node](/workflows/triggers/timer/) - to trigger based on an interval
- [Function Node](/workflows/logic/function/) - to get system memory information
- [Device State Node](/devices/state/) - to report state
- [Debug Node](/workflows/outputs/debug/) - to inspect the payload

Since you've used most of these nodes, we won't walk through each one. For this example, let's set the Timer Node to trigger on an interval of 10 seconds. We will look deeper into the Function Node to see how we are capturing system memory.

### Function Node

If you recall, the Edge Function Node is special. Unlike the cloud, it can require [Node.js modules](https://www.w3schools.com/nodejs/ref_modules.asp). Node.js has a set of built-in modules which you can use without any further installation. One module in particular called `os` allows us to access information about the operating system, like memory.

![Function Node Settings](/images/university/course-six-workshop/function-node-settings.png)

Function Node Configuration:

```javascript
const os = require('os');

const total = os.totalmem();
const free = os.freemem();
const usage = (total - free) / total * 100;

payload.working = {};
payload.working.total = total;
payload.working.free = free;
payload.working.usage = usage;
```

In this Javascript Code, we are using the `os` Node.js module to get the total memory, free memory and calculating percentage usage. Then, attaching to the payload on an object called `working`.

Next, as we did in the last workshop, configure the Device State Node to update these attributes on your device.

### Save and Deploy

After you get done configuring your workflow, click `Save and Deploy`.

![Save and Deploy](/images/university/course-six-workshop/deploy-create-version.png)

If your device is connected, this will be deployed immediately. You know this by taking a look at the Deployment Tab within the Workflow Engine.

![Deployment Tab](/images/university/course-six-workshop/workflow-deployments-tab.png)

There, you should be able to see your device and the status of your latest deployment. If it didn't deploy, check to see if your device is connected.

### Debug

Once we have confirmed that everything is deployed, since our workflow had a Debug Node, we can look at the payload messages in the Debug Panel. But first, because this is an Edge Workflow, we have to specify which device debug messages we want to look at. This is because this workflow could be deployed to many devices at the same time.

![Choose Debug Device](/images/university/course-six-workshop/choose-debug-device.png)

After our device is selected, we should be able to see memory information in the `working` property on our payload.

<div style="padding:20px; background: #efefef; margin: 10px 0px 10px 0px; border-top: 5px #FF495C solid">
<h2>SIDEBAR</h2>
<p style="margin-bottom:2px;">When using the Workflow Engine, it's helpful to have standards. Though you can put data anywhere you want on the payload <code>working</code> is a best practice we settled on at Losant. Everything in <code>working</code> reprents data that we are actively manipulating a workflow. Using <code>working</code> you can always assume that the rest of the payload is untouched, and you may use those values in other nodes without worry.</p>
</div>

Here is what the payload should look like:

![Memory On Payload](/images/university/course-six-workshop/memory-on-payload.png)

To verify that it is indeed saving to a device, you can always check on the Device Debug Page. Next, we need to get system storage. Let’s do that.

## Part Two: Get Storage

Now that we have memory, we can grab storage. Yes, we could use the Function Node here as well, but let's accomplish it using another node: the [Run Executable Node](workflows/data/run-executable/).

<img src="/images/university/course-six-workshop/get-storage-workflow.png" style="width:200px" />

The Run Executable Node allows an edge workflow to run a script or process locally on an Edge Compute device. In other words, it could run the same commands you would run in a terminal. There exists a command called <a href="https://tldr.ostera.io/df"><code>df</code></a>. It's a quick way to get the file system disk space usage.

![df unix command](/images/university/course-six-workshop/df.png)

### Run Executable

Let's use Run Executable Node to run this command, and save that to our device.

![Run Exec Settings](/images/university/course-six-workshop/run-exec-settings.png)

We will need two nodes to do get storage. From the command we saw earlier, we only care about two values in the first line. The first line represents `/dev/root` which is the primary drive on the Pi. Then, from that first line, we need to grab the amount of storage used and the total amount available. We can create two commands to only grab those values.

![df unix command](/images/university/course-six-workshop/df-annotated.png)

For each node, we will need to configure three settings. For the first:

- Command:

```bash
df -k | awk '/%/ && NR < 3 && NR > 1 {print $3 }' | tr -d '\n'
```

- Encoding: UTF8
- Result Path: `working.storage.usage`

For the second:

- Command:

```bash
df -k | awk '/%/ && NR < 3 && NR > 1 {print $4 }' | tr -d '\n'
```

- Encoding: UTF8
- Result Path: `working.storage.total`

<div style="padding:20px; background: #efefef; margin: 10px 0px 10px 0px; border-top: 5px #FF495C solid">
<h2>SIDEBAR</h2>
<p style="margin-bottom:2px;">You may notice other things in the command other than just the <code>df</code> command. The <a href="https://tldr.ostera.io/awk"><code>awk</code></a> and <a href="https://tldr.ostera.io/fr"><code>tr</code></a> commands are other common bash tools to parse the result to get only the values we need. </p>
</div>

Lastly, update the Device State Node to update these attributes on your device.

![Save and Deploy](/images/university/course-six-workshop/deploy-create-version.png)

## What's Next?

Edge Workflows are very valuable for specific types of IoT applications. The best thing you can do for additional practice is to connect the Losant Edge Agent to devices you already own and build Edge Workflows.

## All Done

Congratulations, you are now officially done with Course Six of Losant University! If you run into any troubles along the way, the [Documentation](/) and [Forums](https://forums.losant.com/) are there to help.
