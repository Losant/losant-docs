description: Learn more about the Losant Edge Compute Engine.

# Edge Compute

The Losant Edge Compute Engine is a suite of functionality within the Losant platform that allows for deploying [workflows](/workflows/overview/) to your connected [devices](/devices/overview/) and executing those workflows on the device itself.

## Advantages

Fully utilizing the Edge Compute Engine bring a number of benefits to your application.

### Local Control

The ability to make decisions on the device – and not depend on an internet connection, much less a fast one - can be critical to an IoT application. For example, if you have a vibration sensor attached to a machine and that machine should shut down if vibration levels spike (a clear indication of a fault), even a one-second difference can mean the difference between a simple repair and a new piece of equipment.

This difference is achieved by acting on the value of that sensor and making the "shut-down" decision locally on the device via an [edge workflow](/workflows/edge-workflows/) - instead of sending the sensor readings through the internet up to the cloud, where the evaluation takes place in a [cloud workflow](/workflows/cloud-workflows/) and a command is sent back through the internet to the machine to shut down.

### Low Connectivity Solutions

If your devices are deployed in environments where internet service is spotty or intermittent, you can use the Edge Compute Engine to accumulate state reports on the device. Then, the next time the device connects, those reports can be sent up to the cloud platform.

### Data Filtering

Your devices and sensors can potentially generate hundreds of data points per second, and it's likely you only care about anomalies in these data points. By filtering the sensor values at the local level, you can dramatically reduce data noise within your application, reduce the number of [payloads](/organizations/resource-limits/#payload-limits) generated and save battery life by reducing bandwidth.

### Low-Code Applications

Much like with the [Workflow Engine](/workflows/overview/) itself, the Edge Compute Engine allows less-technical end users to make behavior changes within their connected devices without having to work in a coding environment. Updating, versioning and deploying the changes is all done through Losant's web interface.

## Using Edge Compute

To get started with the Edge Compute Engine, you will have to follow these steps. More information on each is available within each's section's respective documentation.

1.   In your [application](/applications/overview/), create a [new device](/devices/overview/#adding-a-device) and set its [device type](/devices/overview/#device-type) to "Edge Compute". Only devices of this type can receive workflows to run locally from the Losant platform.
2.   [Create an access key and secret](/applications/access-keys/#generating-an-access-key) for your new device. While we always recommend generating a new key/secret pair per device, this step may not be necessary if you already have a key and secret configured to work for all devices in your application, or to work for all devices with a tag that you applied to your device during creation.
3.   Deploy the [Edge Agent](/edge-compute/edge-agent/) to your new device and configure it using the device ID, key and secret from your previous steps. The Edge Agent software package is necessary to receive edge workflows from Losant and to run them on the device.
4.   Create a [new workflow](/workflows/overview/#creating-a-workflow) of the "Edge Workflow" type. Make sure the [Target Agent Version](/workflows/edge-workflows/#edge-agent-version) is less than or equal to the version of the Edge Agent you deployed to the device in the previous step.
5.   [Set up your workflow](/workflows/overview/#overview) using any of the nodes in the palette and [save your work](/workflows/edge-workflows/#saving-changes).
6.   When it is ready, [deploy a version of your workflow](/edge-compute/edge-deployments/) to your edge compute device(s). If the device is [connected to Losant's MQTT broker](/mqtt/overview/) – or when it connects next – the edge workflow version will deploy to the device and it will begin executing.

Installing or upgrading the [Edge Agent](/edge-compute/edge-agent/) requires physical access to the device. After that, management of all edge compute functionality - device configuration, workflow setup and deployment schedules – takes place within the Losant platform and updates are pushed down to the devices over the internet.