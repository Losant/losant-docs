---
description: Learn about including a external website on a Losant Dashboard.
---

# External Website

The External Website Block allows you to display some other web page or status board along side Losant information on your Losant dashboard.

![External Website](/images/dashboards/external-example.png "External Website")

## Configuration

The block only takes one parameter: a URL to display. This URL **must** be served over HTTPS.

The web page returned by the URL is displayed within an `<iframe>` and you can interact with it like any other web page. Note, however, that complex pages displayed within this block may act or display in unexpected ways. While it is unlikely to cause issues with the dashboard as a whole, it can possibly make interactions with your other components more difficult.

![External Website Config](/images/dashboards/external-config.png "External Website Config")
