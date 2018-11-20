flowclass: Application
flowclass: Experience
description: Learn more about the Losant SMS Node.

# SMS Node

The SMS Node allows a workflow to send SMS messages using Losant provided SMS delivery. NOTE: This node is rate limited to one SMS message every five minutes per workflow (bursts of up to 10 allowed), and will also not send SMS messages that cost more than 6 cents. If more frequent or complex SMS messages are required, please use the [Twilio Node](/workflows/outputs/twilio/).

![SMS Node](/images/workflows/outputs/sms-node.png "SMS Node")

## Configuration

The SMS Node has the basic configuration properties needed to send an SMS message. For more advanced capabilities, please use the [Twilio Node](/workflows/outputs/twilio/). The two configuration properties to set are the phone number to send the SMS message to, and the content of the message to send. Both fields support [string templates](/workflows/accessing-payload-data/#string-templates), and so can be dynamically determined from the payload of the currently executing workflow.

![SMS Node Config](/images/workflows/outputs/sms-node-config.png "SMS Node Config")

In the example above, the phone number being sent to is `(212) 867-5309` and the contents of the message to being sent to that phone number will be `Power level exceeded error threshold at {{ data.power }}!` (where `{{ data.power}}` will be replaced with the current value of `data.power` in the payload).
