---
description: Learn about how to use an Image Block on your Losant Dashboard
---

# Image

The Image Block allows you to display an image of your choice along side Losant information on your Losant dashboard.

![Image Block](/images/dashboards/image-block-example.png "Image Block")

## Configuration

The block takes two parameters:

* **Image URL**: This is the url of the image you would like to display. It can be stored within your application's [Files](/applications/files/), or can be any publicly accessible image URL. The URL supports [string templates](/workflows/accessing-payload-data/#string-templates), and so you can dynamically change the image based on [dashboard context](/dashboards/context-variables/). The image will be displayed scaled to the size of the block on your dashboard.

* **Link**: You can optionally have the image also be a link to the URL of your choice. This field supports [string templates](/workflows/accessing-payload-data/#string-templates) as well, letting you change the link based on [dashboard context](/dashboards/context-variables/). If you would like this link to open in a new browser window or tab, check the `Open in new window` checkbox.

![Image Block Config](/images/dashboards/image-block-config.png "Image Block Config")