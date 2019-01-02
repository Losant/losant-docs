---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant MQTT Node.
---

# MQTT Node

The MQTT Node allows a workflow to publish a message to the configured topic on the Losant MQTT broker. If used within an [application workflow](/workflows/application-workflows/) or [experience workflow](/workflows/experience-workflows/), the node can also be configured to publish to one of your [MQTT broker integrations](/applications/integrations/#mqtt).

![MQTT Node](/images/workflows/outputs/mqtt-node.png "MQTT Node")

## Configuration

There are three properties to configure for the MQTT Node:

* **Broker** is the MQTT broker on which to publish the topic. By default this is the [Losant broker](/mqtt/overview/#the-losant-message-broker), but you may also choose one of your [MQTT broker integrations](/applications/integrations/#mqtt). This option is not available in [edge workflows](/workflows/edge-workflows/); in that case, the node will always publish on the Losant MQTT broker.
* **Topic Template** is a [string template](/workflows/accessing-payload-data/#string-templates) for the topic to publish the message on. This must render to a [valid topic name](http://www.hivemq.com/blog/mqtt-essentials-part-5-mqtt-topics-best-practices), and depending on the broker, there may be additional rules around the topic's format. For example, when publishing to the Losant broker, the topic cannot be a wildcard topic, an MQTT system topic, or a Losant-specific topic. *(Note: It is not necessary to be subscribed to a topic in your integration in order to publish to it.)*
* **Message Template** is an optional [string template](/workflows/accessing-payload-data/#string-templates). If no message is given, a blank message is published on the configured topic.

In the above example, the contents of the `container.string` field on the current payload will be published to the Losant broker on the MQTT topic `new/commands`.

## Throttling And Limits

The MQTT Node (when sending messages over the Losant broker) has the same throttling rules as using the [broker](/organizations/resource-limits/#message-throttling) directly - it is limited to 30 calls in a 15-second window (per topic) - on average, 2 calls per second.
