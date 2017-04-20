# MQTT Node

The MQTT node allows a workflow to publish a message to the configured topic on either the Losant MQTT Broker or one of your [MQTT broker integrations](/applications/integrations/#mqtt).

![MQTT Node](/images/workflows/outputs/mqtt-node.png "MQTT Node")

## Configuration

There are three properties to configure for the MQTT node:

* **Broker** is the MQTT broker on which to publish the topic. By default this is the [Losant broker](/mqtt/overview/#the-losant-message-broker), but you may also choose one of your [MQTT broker integrations](/applications/integrations/#mqtt).
* **Topic** is a [string template](/workflows/accessing-payload-data/#string-templates) for the topic to publish the message on. This must render to a [valid topic name](http://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices), and depending on the broker, there may be additional rules around the topic's format. For example, when publishing to the Losant broker, the topic cannot be a wildcard topic, an MQTT system topic or a Losant-specific topic.
* **Message** is an optional [string template](/workflows/accessing-payload-data/#string-templates). If no message is given, a blank message is published on the configured topic.

In the above example, the contents of the `container.string` field on the current payload will be published to the Losant broker on the MQTT topic `new/commands`.
