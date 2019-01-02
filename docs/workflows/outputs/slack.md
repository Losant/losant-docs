---
flowclass:
  - Application
  - Experience
  - Edge 1.0.0
description: Learn more about the Losant Slack Node.
---

# Slack Node

The Slack Node allows a workflow to send messages to a [Slack](https://slack.com/) channel.

![Slack Node](/images/workflows/outputs/slack-node.png "Slack Node")

## Configuration

The Slack Node has three configuration properties - the Slack Webhook URL, the Slack channel, and the message to send to that channel.

![Slack Node Config](/images/workflows/outputs/slack-node-config.png "Slack Node Config")

Slack Incoming Webhook URLs can be created in Slack's [incoming webhook integration](https://my.slack.com/services/new/incoming-webhook/). The URL of a configured webhook should be used as the webhook URL in the Slack Node configuration.

Both the URL field and the channel field support [string templates](/workflows/accessing-payload-data/#string-templates). The channel field is optional, and if left blank, the message will be sent to the default room for the chosen Slack incoming webhook. If a specific channel is desired, remember to prefix it with the '#' sign.

The message field also supports [string templates](/workflows/accessing-payload-data/#string-templates); however, if the message is left completely blank, the entire payload of the workflow will be sent to the Slack room.

In the example above, the message `Power level exceeded error threshold at {{ data.power }}!` (where `{{ data.power}}` will be replaced with the current value of `data.power` in the payload) will be sent to the Slack channel `#emergency`.
