# Twilio Node

The Twilio node allows a workflow to send SMS messages using the configured [Twilio](https://www.twilio.com/) account.

![Twilio Node](/images/workflows/outputs/twilio-node.png "Twilio Node")

## Configuration

The Twilio node has a large number of configuration properties - everything needed to configure use of a Twilio account and the sending of SMS messages.

### Twilio Account Configuration

![Twilio Node Account Config](/images/workflows/outputs/twilio-node-account-config.png "Twilio Node Account Config")

The most important part of the configuration is the Account SID and Auth Token for the Twilio account that should be used to send the SMS messages. In the example above, the node is configured to use the the Account SID `YOUR_TWILIO_ACCOUNT_SID_HERE` and the Auth Token `YOUR_TWILIO_AUTH_TOKEN_HERE`.

Optionally, the maximum allowed price of an SMS message can be configured (see Twilio's [API Docs](https://www.twilio.com/docs/api/rest/sending-messages) for more information on this field).

All of the account configuration inputs, except for the maximum price, support [string templates](/workflows/accessing-payload-data/#string-templates).

### Message Configuration

![Twilio Node Message Config](/images/workflows/outputs/twilio-node-message-config.png "Twilio Node Message Config")

When configuring the actually SMS message, a "From Number" or "From SID" (MessagingServiceSid) must be provided to be the source of the SMS message. The field supports [string templates](/workflows/accessing-payload-data/#string-templates), but in the common case this will be set to a static value.

Next is the actual message to send - this can include a message, a media URL, or both. At least one of the two must be provided. Both fields support [string templates](/workflows/accessing-payload-data/#string-templates). In the above example, only the message is being set, to the value `Power level exceeded error threshold at {{ data.power }}!`

### Recipient Numbers

![Twilio Node Recipient Numbers](/images/workflows/outputs/twilio-node-recipient-numbers.png "Twilio Node Recipient Numbers")

Multiple phone numbers can be provided to the Twilio node. The recipient phone number fields support [string templates](/workflows/accessing-payload-data/#string-templates), so the phone numbers can potentially be pulled off of the payload. Values that do not render to valid phone numbers are ignored. As a note, when multiple phone numbers are defined, multiple individual SMS messages will be sent - one to each recipient phone number (it does not create a group SMS message). In the above example, the SMS message is only sent to a single phone number, `(212) 867-5309`.
