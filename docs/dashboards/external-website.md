# External Website

The External Website block allows you to display some other web page or status board along side Structure information on your Structure dashboard.

![External Website](/images/dashboards/external-example.png "External Website")

## Configuration

The block only takes one parameter: a URL to display. The web page returned by the URL is displayed within an `<iframe>` and you can interact with it like any other web page. Note, however, that behavior of pages within this block is unexpected and, while it is unlikely to cause breaking changes to your dashboard, it can possibly make interactions with your other components more difficult.

![External Config](/images/dashboards/external-config.png "External Config")
