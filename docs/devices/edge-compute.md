---
description: Learn more about configuring Edge Compute devices in the Losant platform.
---

# Edge Compute Devices

Edge devices are similar to the concept of a [gateway device](/devices/gateways-peripherals/), but have the power to act on the data they receive from their peripherals. Because Losant operates in the cloud, there is latency in receiving and acting on device state over the network. By installing an Edge Compute device and running an [Edge Agent](/edge-compute/edge-agent-usage/) you can reduce the latency involved to just the latency over your local network. It's like having your own personal Losant!

## Creating a Device

You can create an Edge Compute device through the same flow that all devices are created. Just choose "Edge Compute" from the device creation screen.

![Add Edge Compute device](/images/devices/edge-compute/create-edge-compute-device.png "Add Edge Compute device")

Once created, make note of the `Device ID` at the top right of the device page. To finish the setup, you'll need to configure and run the Losant Edge Agent. You can read more about the Edge Agent [here](/edge-compute/overview/), and read about detailed setup/usage instructions [here](/edge-compute/edge-agent-installation/).

## Supported Devices

The following devices have been tested and are known to work as an Edge Compute device.

|                                                                                        |                                                                                                |
| -------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| **Raspberry Pi 2** ([info][pi-2-info]) ![Raspberry Pi 2][pi-2-image]                   | **Raspberry Pi 3** ([info][pi-3-info]) ![Raspberry Pi 3][pi-3-image]                           |
| **Advantech UTX-3115** ([info][advantech-info]) ![Advantech UTX-3115][advantech-image] | **BeagleBone Black** ([info][beaglebone-info]) ![BeagleBone Black][beaglebone-image]           |
| **Intel's FRD Platform** ([info][frd-info]) ![Intel's FRD Platform][frd-image]         | **Dell Edge Gateway 3001** ([info][dell-3001-info]) ![Dell Edge Gateway 3001][dell-3001-image] |
| **HPE GL10 IoT Gateway** ([info][gl10-info]) ![HPE GL10 IoT Gateway][gl10-image]       |                                                                                                |

[pi-2-info]: https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[pi-2-image]: /images/devices/edge-compute/raspberry-pi-2.png "Raspberry Pi 2"
[pi-3-info]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[pi-3-image]: /images/devices/edge-compute/raspberry-pi-3.png "Raspberry Pi 3"
[advantech-info]: http://www.advantech.com/products/bda911fe-28bc-4171-aed3-67f76f6a12c8/utx-3115/mod_fa00d5cd-7d2b-430b-8983-c232bfb9f315
[advantech-image]: /images/devices/edge-compute/advantech-utx-3115.png "Advantech UTX-3115"
[beaglebone-info]: http://beagleboard.org/black
[beaglebone-image]: /images/devices/edge-compute/beaglebone-black.png "BeagleBone Black"
[frd-info]: https://www.intel.com/content/www/us/en/internet-of-things/fog-reference-design-overview.html
[frd-image]: /images/devices/edge-compute/intel-frd.png "Intel's FRD Platform"
[dell-3001-info]: http://www.dell.com/en-us/work/shop/cty/pdp/spd/dell-edge-gateway-3001/ctoi3001stdus
[dell-3001-image]: /images/devices/edge-compute/dell-3001.png "Dell Edge Gateway 3001"
[gl10-info]: https://www.hpe.com/us/en/product-catalog/servers/edgeline-systems/pip.hpe-edgeline-el10-intelligent-gateway.1008670386.html
[gl10-image]: /images/devices/edge-compute/hpe-gl10.png "HPE GL10 IoT Gateway"

<!--
Images are 462x322
-->

## Minimum Requirements

The [Edge Agent](/edge-compute/overview/) must be running on your device and connected to Losant. It runs as a [Docker](https://www.docker.com/what-docker) container and expects some amount of memory to be carved out for it. Your mileage may vary, but users have had success with the following specifications. See below for supported devices.

- Memory: `512MB`
- CPU: `1Ghz Single-core`
- Architecture: `amd64`, `arm`, `arm64`

<!--
Docker minimum requirements (unofficial)
https://forums.docker.com/t/minimum-hardware-requirement-to-run-docker/28072/3
-->
