---
description: Become a Losant expert with Losant University. This is the Course Six Workshop on the Edge Agent.
---

# Edge Agent Workshop

![Workshop Image](/images/university/workshop.jpg)

## Introduction

Welcome to your workshop on the Edge Agent. The purpose of this workshop to get your hands dirty with the edge agent. In the course, we installed the agent, talked about using it, and covered some of the nodes. Now, let's put some of that to use to our example.

## Review

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

In Course Five, we used the Workflow Engine to simulate data, trigger alerts, learned to use the Virtual Button Node.

![Completed simulated workflow](/images/university/course-five-workshop/completed-simulated-workflow.png)

## Overview

Now that we’ve covered the Edge Agent, we make use of it in this application.

In the real world, our pump would possibly have a PLC that exposed local Modbus TCP. In that case, we could use the Edge Agent to talk to the pump. However, since we don't have an actual pump with a PLC, we will continue to let the cloud simulate the data and generate other data on the Pi.

To demonstrate the Edge Agent we are going to read system memory and storage from the Raspberry Pi.

In this workshop we are going to:

- Use the [Function Node](/workflows/logic/function/) to read the device memory.
- Use the [Run Executable Node](/workflows/data/run-executable/) to read the device storage.

Let’s begin.

## Materials:

This workshop assumes that you are using a [Raspberry Pi](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/) as your edge device.

![Raspberry Pi](/images/university/course-six-workshop/raspberrypi.jpg)

If you don't own a Raspberry Pi, remember that the edge agent can be installed on your own computer running MacOS or Windows.

## Part One: Installation

Before we can begin, we need to install the Edge Agent on our Pi. We covered these in the first two video in the course.

Please refer to the installation documentation: [Losant Edge Agent Installation](/edge-compute/edge-agent-installation/)

After you have it installed, we need to get it running: [Losant Edge Agent Usage](/edge-compute/edge-agent-usage/)

**Important**: You will be creating a new device for the edge agent. 

Once done, you should be able to run the `docker logs` command:

![Pi Docker Logs](/images/university/course-six-workshop/pi-docker-logs.png)

You should also see your device connected within Losant:

![Connected Edge Device](/images/university/course-six-workshop/connected-edge-device.png)

## Part One: Reading Memory

Before we start, we need to add some new attributes to our edge device in Losant.

![New Device Attributes](/images/university/course-six-workshop/new-device-attributes.png)

We are going to add the following:

- `total_memory` - Total memory on the edge device
- `percentage_memory` - Percentage memory used on the edge device
- `free_memory` - Free memory on the edge device
- `used_storage` - Amount of storage used on the edge device
- `total_storage` - Total amount of storage on the edge device

Next, we need to create a new Edge Workflow:

![Create New Edge Workflow](/images/university/course-six-workshop/create-new-edge-workflow.png)

Here is the workflow we are going to build to get system memory:

<img src="/images/university/course-six-workshop/get-memory-workflow.png" style="width:200px" />

The goal of this workflow is to, on an interval, get system memory information, and report the state to the edge device. To do this we need the following nodes:

- [Timer Trigger Node](https://docs.losant.com/workflows/triggers/timer/) - to trigger based on an interval
- [Function Node](https://docs.losant.com/workflows/logic/function/) - to get system memory information
- [Device State Node](https://docs.losant.com/devices/state/) - to report state
- [Debug Node](https://docs.losant.com/workflows/outputs/debug/) - to inspect the payload

Since you've used most of these nodes, we won't walk though each one. For this example, let's set the Timer Node to trigger on an interval of 10 seconds. We will look deeper in to the Function Node to see how we are capturing system memory. 

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

Next, like we did in the last workshop, configure the Device State Node to update these attributes on your device.

### Save and Deploy

After you get done configuring your workflow, click `Save and Deploy`.

![Save and Deploy](/images/university/course-six-workshop/deploy-create-version.png)

![Deployment Tab](/images/university/course-six-workshop/workflow-deployments-tab.png)

![Choose Debug Device](/images/university/course-six-workshop/choose-debug-device.png)

![Memory On Payload](/images/university/course-six-workshop/memory-on-payload.png)

Next, we need to get system storage. Let’s do that.

## Part Two: Get Storage

![Get Storage Workflow](/images/university/course-six-workshop/get-storage-workflow.png)

![df unix command](/images/university/course-six-workshop/df.png)

![Run Exec Settings](/images/university/course-six-workshop/run-exec-settings.png)

Command:
```bash
df -k | awk '/%/ && NR < 3 && NR > 1 {print $3 }' | tr -d '\n'
```
Encoding `UTF8`
Result Path:
```working.storage.usage```

Command:
```bash
df -k | awk '/%/ && NR < 3 && NR > 1 {print $4 }' | tr -d '\n'
```
Encoding `UTF8`
Result Path:
```working.storage.total```

Lastly, update the Device State Node to update these attributes on your device.

![Save and Deploy](/images/university/course-six-workshop/deploy-create-version.png)



## All done

Now, we are beginning to have a more complete application on our hands.

- Use the Workflow Engine to simulate device data permanently
- Configure an Input Control Block to trigger a workflow.
- Use the Workflow Engine to email an alert when a devices’ state is out of range.

### More to Explore

If you already have problems that you would like to try out, please do! There is a ton more you can do with your application. Here are a few examples:

### Connect to Local Devices

In this workshop, we didn’t bring in any external data. Try bringing weather data into our application, and build a dashboard around it. There is already complete instructions on how to do this in the [Losant Walkthrough](https://docs.losant.com/getting-started/walkthrough/).

![Weather Dashboard](/images/getting-started/walkthrough/dashboard-full.png)

### Edge Web Server

In this workshop, we didn’t bring in any external data. Try bringing weather data into our application, and build a dashboard around it. There is already complete instructions on how to do this in the [Losant Walkthrough](https://docs.losant.com/getting-started/walkthrough/).

![Weather Dashboard](/images/getting-started/walkthrough/dashboard-full.png)

## What's Next?

Congratulations, you are now officially done with Course Six of Losant University!

Feel free to poke around Losant; there is a ton to explore. If you run into any troubles along the way, the [Documentation](https://docs.losant.com/) and [Forums](https://forums.losant.com/) are there to help.
