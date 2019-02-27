---
description: Losant is an easy-to-use and powerful enterprise IoT platform designed to help you quickly and securely build complex connected solutions.
---

# What is Losant?

Losant is an easy-to-use and powerful enterprise IoT platform designed to help you quickly and securely build complex connected solutions. Losant uses open communication standards like REST and MQTT to provide connectivity from one to millions of devices. Losant provides powerful data collection, aggregation, and visualization features to help understand and quantify vast amounts of sensor data. Losant's drag-and-drop workflow editor allows you to trigger actions, notifications, and machine-to-machine communication without programming.

![Overview Diagram](/images/getting-started/overview-diagram.png "Overview Diagram")

If you don't have a device, but still want to experience many of the features Losant provides, please check out the [Losant Walkthrough](/getting-started/walkthrough/), which will guide you through building a local weather dashboard.

## Device Connectivity

Losant provides device connectivity using open and industry standards like [MQTT](/mqtt/overview/) and [REST](/rest-api/overview/). This allows any custom device to connect to the Losant Platform using tools and libraries available for almost any environment.

![Communication Diagram](/images/getting-started/communication-diagram.png "Communication Diagram")

Losant provides open source clients for both our [MQTT](/mqtt/overview/) and [REST](/rest-api/overview/) APIs for Node.js, Ruby, Python, and Arduino. This allows devices based on these technologies to quickly connect without requiring any additional implementation for the communication.

The two major communication mechanisms between devices and Losant are [state](/devices/state/) and [commands](/devices/commands/). State represents a snapshot of the device at some point in time. This is typically sensor data or some other periodic information the device generates. Devices will report state as often as needed, for example a device that reports temperature may report every few minutes, whereas a device with a button may only report when the button is pressed.

Commands allow you to instruct your devices to take specific actions. What commands are supported is entirely up to your device and its firmware. For example, if the device is a scrolling marquee, a command it might support is "update text" with a payload that includes the text to display.

## Data Collection, Aggregation, Visualization

All state information reported by devices is stored. This allows you to visualize complex aggregations across one or more devices. For example, if you manufacture water quality sensors, Losant easily provides the ability to view, in real-time, the average water quality across all sensors, or view an average for a subset like a region or single building.

![Full Dashboard](/images/getting-started/dashboard-full.png "Full Dashboard")

Losant's customizable dashboarding tools allow you to display and arrange information most important to your application.

![Dashboard Resize](/images/getting-started/dashboard-resize.gif "Dashboard Resize")

## Workflows

Losant's drag-and-drop [workflow](/workflows/overview/) editor allows you to easily build complex interactions between your devices and 3rd party systems.

![Workflow](/images/getting-started/workflow.png "Workflow")

Workflows can be triggered by devices, timers, webhooks, and many other inputs. Outputs can be other devices, 3rd party systems, emails, sms, and many more. Losant's workflows provide a simple way connect your things together and move complex business logic off of your devices and into the cloud.
