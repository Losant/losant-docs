# Slack Node

The Slack node allows a workflow to send messages to a [Slack](https://slack.com/) channel.

![Slack Node](/images/workflows/outputs/slack-node.png "Slack Node")

## Configuration

The Slack node has 3 configuration properites - the Slack Webhook URL, the Slack channel, and the message to send to that channel.

![Slack Node Config](/images/workflows/outputs/slack-node-config.png "Slack Node Config")

Slack Incoming Webhook URLs can be created in Slack's [incoming webhook integration](https://my.slack.com/services/new/incoming-webhook/). The url of a configured webhook should be used as the webhook url in the Slack node configuration. The channel field is optional (but does support payload templating), and if left blank, the message will be sent to the default room for the choosen Slack incoming webhook. If a specific channel is desired, it remember to prefix it with the '#' sign. The message field is also templatable, but has the special property that if left completely blank, the entire payload of the workflow will be sent to the slack room.

In the example above, the message `Power level exceeded error threshold at {{ data.power }}!` (where `{{ data.power}}` will be replaced with the current value of `data.power` in the payload) will be sent to the Slack channel `#emergency`.
