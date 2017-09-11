# Email Node

The email node allows a workflow to send emails using Losant provided email delivery. NOTE: This node is rate limited to one email per minute, and is limited to a maximum of 5 recipients per email. If more frequent emails or more advanced recipient configuration is required, please use the [SendGrid node](/workflows/outputs/sendgrid/).

![Email Node](/images/workflows/outputs/email-node.png "Email Node")

## Configuration

The email node has the basic configuration properties needed to send an email. For more advanced capabilities, please use the [SendGrid node](/workflows/outputs/sendgrid/).

### Recipient Addresses

![Email Node To Addresses](/images/workflows/outputs/email-node-to-addresses.png "Email Node To Addresses")

The email node supports any number of "To" addresses for the email. These address fields support [string templates](/workflows/accessing-payload-data/#string-templates), so they can pull email addresses off of the current workflow payload. The above node is set to send the email to `bob@embree.net` and `john@embree.net`.

### Message Contents

![Email Node Message Contents](/images/workflows/outputs/email-node-message-contents.png "Email Node Message Contents")

Next, the contents of the email can be configured. There are three items to configure here - the "From" address, the subject of the email, and the body of the email. All three of these fields support [string templates](/workflows/accessing-payload-data/#string-templates), so they can be dynamic based on the current workflow payload. The subject and the body are required, and if the "From" address is not set the email will be sent with a from address of `noreply@losant.com`. In the example above, the "From" address is set to `alerts@embree.net`, the subject is set to `Power Consumption Warning!`, and finally the body is set to `Power level exceeded error threshold at {{ data.power }}!`.
