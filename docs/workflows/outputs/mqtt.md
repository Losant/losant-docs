# MQTT Node

The MQTT node allows a workflow to publish a message on the configured topic on the Structure MQTT Broker.

![MQTT Node](/images/workflows/outputs/mqtt-node.png "MQTT Node")

## Configuration

There are two properties to configure for the MQTT node - the topic to publish on, and the message to publish.

![MQTT Node Config](/images/workflows/outputs/mqtt-node-config.png "MQTT Node Config")

The topic to publish on is required and must be a valid MQTT topic name, but is not allowed to be a wildcard topic, a MQTT system topic, or a Structure specific topic.  The topic supports templating, so dynamic topics based upon the current payload are possible. The message to publish also supports standard templating and is optional - if no message is given, a blank message is published on the configured topic.

In the above example, the contents of the `container.jsonString` field on the current payload will be published on the MQTT topic `new/commands`.
