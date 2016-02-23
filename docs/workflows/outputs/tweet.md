# Tweet Node

The Tweet node allows a workflow to post a tweet to a linked [Twitter](https://twitter.com/) account.

![Tweet Node](/images/workflows/outputs/tweet-node.png "Tweet Node")

## Linking To Twitter

For the tweet node to work, the Structure account that owns the workflow must be linked to Twitter.  This is due to the fact that Twitter uses Oauth to provide API access instead of API Keys - so it is not possible to just configure a Twitter node with API keys as Structure does with nodes such as [SendGrid](/workflows/outputs/sendgrid).

If no Twitter account has been linked, the configuration for the tweet node will just prompt to link an account:

![Tweet Node - No Account](/images/workflows/outputs/tweet-node-no-account.png "Tweet Node - No Account")

To link with Twitter, follow the link in the tweet node configuration, or go to "Account Links" under "Account Settings".  See the [Account Links](/user-accounts/overview/#account-links) documentation for more information.

Once linked with Twitter, the tweet node will show what account it will tweet under, and will have a text area for configuring the message to tweet.  The message supports payload templating - but remember to keep the message under the Twitter character limit, otherwise the tweet will be rejected.

![Tweet Node - Linked Account](/images/workflows/outputs/tweet-node-linked-account.png "Tweet Node - Linked Account")

In the example above, the tweet `Power level exceeded error threshold at {{ data.power }}!` (where `{{ data.power}}` will be replaced with the current value of `data.power` in the payload) will be posted to the twitter handle `@embreeEmergency`.
