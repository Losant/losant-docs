# Tweet Node

The Tweet node allows a workflow to post a tweet using the provided [Twitter](https://twitter.com/) application and account.

![Tweet Node](/images/workflows/outputs/tweet-node.png "Tweet Node")

## Configuration

For the tweet node to work, Losant needs a number of different Twitter authorization keys.  This is due to the fact that the Twitter API requires a [Twitter Application](https://apps.twitter.com/app/new) in order to interact with the Twitter API.  The first two values that Losant needs are the `Consumer Key` and `Consumer Secret` of the Twitter application that Losant should use.  These values can be found at the top of the "Keys And Access Tokens" tab in the settings of a Twitter application.

![Tweet Node - Consumer Key And Secret](/images/workflows/outputs/tweet-node-consumer.png "Tweet Node - Consumer Key And Secret")

Above, the tweet node is configured with `YOUR_APP_CONSUMER_KEY_HERE` as the Consumer Key and `YOUR_APP_CONSUMER_SECRET_HERE` as the Consumer Secret.

Next Losant needs the tokens specific to the user account that the tweets will go out under.  These are the `Access Token` and `Access Token Secret`, and are specifically tied to the Twitter Application configured above.  These values can be found at the bottom of the "Keys And Access Tokens" tab in the settings of a Twitter application, under the "Your Access Token" section.

![Tweet Node - User Token](/images/workflows/outputs/tweet-node-user.png "Tweet Node - User Token")

Above, the tweet node is configured with `YOUR_USER_ACCESS_TOKEN_HERE` as the Access Token and `YOUR_USER_ACCESS_TOKEN_SECRET_HERE` as the Access Token Secret.

Finally, now that all of those settings are configured, the actual tweet itself can be configured. The message field supports standard payload templating - but remember to keep the message under the Twitter character limit, otherwise the tweet will be rejected.

![Tweet Node - Message](/images/workflows/outputs/tweet-node-message.png "Tweet Node - Message")

In the example above, the tweet "Power level exceeded error threshold at {{ data.power }}!" (where `{{ data.power}}` will be replaced with the current value of `data.power` in the payload) will be posted to Twitter.
