# Device Queries

Many features within the Structure platform require users to provide a list of devices to interact with. For example:

* Dashboard blocks can visualize data from one or many devices
* Workflows can trigger commands to one or more devices
* Access keys can limit access to specific devices within your application

This list is provided in the form of a **device query**. In short, a device query is a **list of device IDs and device tags**. Queries are inclusive, meaning that if any condition in the query returns true, the device ID or tagged devices are returned.

![Device Queries](/images/devices/device-query.png "Device Queries")

## Constructing Device Queries

When prompted by a component to provide a device, a device tag, or a combination of the two, select the input and begin typing. You will then see a list of devices or tags that match your current search parameter.

Once you have found the device / tag you would like to add to your query, either click the item to add it to the query, or toggle your keyboard arrows down to the item you'd like to add and press enter.

![Device Query Select](/images/devices/device-query-select.png "Device Query Select")


## Querying by Devices

When creating a device, you are prompted to give your new device a name; and immediately after creation, that device is assigned an ID by Structure. When searching for a device to add to your query, you may enter any part of the device's name or ID to find it.

You may provide just a single ID to interact with one device, or you may provide a list of as many device IDs as you would like to interact with multiple specific devices.

![Device Queries One or Many](/images/devices/device-query-one-or-many.png "Device Queries One or Many")

Some components in the Structure platform only accept one device at a time, in which case you will only be able to select one device.

![Device Query One Device](/images/devices/device-query-one-device.png "Device Query One Device")

## Querying by Device Tags

Queries may also be built against the tags you assign to your devices. Tags may be added, edited or deleted from a device at any time, which allows you to easily add or remove devices from dashboard visualizations, workflows and security groups without having to individually edit those components.

To add a tag to a device query, start typing any key or value that has been assigned to a device within your currently selected application. You will see a list of suggestions and, just like with devices, you may then add that tag to your query. Any device that matches the provided tag will then be returned by your query.

Note that you will see wildcard options in your tag searches; selecting one of these options (either a `key=*` or a `value=*` option) will return all devices within your application that have either that provided key or value assigned to it, regardless of the other value.

![Device Queries Wildcards](/images/devices/device-query-wildcard.png "Device Queries Wildcards")

## Removing Items from a Query

Items can be removed from the query at any time. If the query only accepts one value, click the "x" to the right to delete the device / tag.

![Delete Only](/images/devices/device-query-delete-single.png "Delete Only")

If the query takes multiple items, you may remove a single item by clicking the "x" in the item's box ...

![Delete One](/images/devices/device-query-delete-one.png "Delete One")

... or you may delete all of your entries by clicking the "x" to the right.

![Delete All](/images/devices/device-query-delete-all.png "Delete All")
