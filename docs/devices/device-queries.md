# Device Queries

Many features within the Structure platform require users to provide a list of devices to interact with. For example:

* Dashboard blocks can visualize data from one or many devices
* Workflows can trigger commands to one or more devices
* Access keys can limit access to specific devices within your application

This list is provided in the form of a **device query**. In short, a device query is a **comma-separated list of device IDs and device tags**. Queries are inclusive, meaning that if any condition in the query returns true, the device ID or tagged devices are returned.

![Device Queries](/images/devices/device-query.png "Device Queries")

## Querying by Device IDs

Device IDs are assigned immediately after registering a device on the Structure platform. IDs are numeric and are 24 characters long. You may provide just a single ID to interact with one device, or you may provide a list of as many device IDs as you would like to interact with multiple specific devices.

## Querying by Device Tags

Devices may also be queried against the tags you provide. Tags may be added, edited or deleted from a device at any time, which allows for you to easily add or remove devices from dashboard visualizations, workflows and security groups without having to individually edit those components.

Tags are queried in a `key=value` format, where `key` is a property defined by the user and `value` is a value assigned to that property.

Note that, in your device queries, it is not necessary to provide both a key and a value. For example, if you would like to return all devices where a given key has been set regardless of its value, you may write that query as `key=`, leaving the `value` out. You may do the opposite as well for querying against values regardless of their key by writing your query in the `=value` format.

## Examples

Here are a few example device queries ...

+ `1a2b3c4d5e6f7g8h9i0j1k2l` - Returns one device by ID
+ `1a2b3c4d5e6f7g8h9i0j1k2l,3m4n5o6p7q8r9s0t1u2v3w4x` - Returns two devices by ID
+ `vehicle=truck` - Returns all devices with the `vehicle` tag whose value is `truck`
+ `vehicle=` - Returns all devices with the `vehicle` tag, regardless of its value
+ `=truck` - Returns all devices with a tag value of `truck`, regardless of its key
+ `vehicle=truck,color=` - Returns all devices with the `vehicle` tag whose value is `truck`, OR with the `color` tag, regardless of its value
+ `color=red,1a2b3c4d5e6f7g8h9i0j1k2l` - Returns all devices with the `color` tag whose value is red, in addition to the device with the provided ID
