# Google Pub/Sub

The Google Pub/Sub node allows a workflow to publish a message to one of your [Google Pub/Sub integrations](/applications/integrations/#google-pubsub) on a topic of your choosing.

![Google Pub/Sub Node](/images/workflows/outputs/google-pub-sub-node.png "Google Pub/Sub Node")

## Configuration

Configuration for the node is broken up into four sections.

### Integration & Topic

The **Integration** is the [Google Pub/Sub integration](/applications/integrations/#google-pubsub) you created prior to configuring this node.

The **Topic Template** is the topic on which the message will be published. *(Note: It is not necessary to be subscribed to a topic in your integration in order to publish to it.)*

### Message

This is the message that is actually published to your topic. You may define this message one of two ways:

* **String Template** accepts a [string template](/workflows/accessing-payload-data/#string-templates) for the message - or a plain string.
* **Payload Path** accepts a [payload path](/workflows/accessing-payload-data/#payload-paths) for the message.

### Attributes

You may optionally include some attributes along with your message. Attributes are a map of key/value pairs. There are three methods by which you may include the attributes:

* **Individual Fields** allows you to enter each key/value separately, with the key and the value both accepting [string templates](/workflows/accessing-payload-data/#string-templates).
* **Json Template** accepts an object of key/value pairs in one block. The object may not contain any nested properties, and [Handlebars helpers](/workflows/accessing-payload-data/#json-templates) may be used for either the keys or values.
* **Payload Path** accepts a [payload path](/workflows/accessing-payload-data/#payload-paths) to an object of key/value pairs on your payload.

### Result Path

Optionally, you can store the message response on the current payload by entering a [payload path](/workflows/accessing-payload-data/#payload-paths) here.
