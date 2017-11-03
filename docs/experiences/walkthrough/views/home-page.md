# Part 3 - Home Page

In the [previous part](/experiences/walkthrough/views/page-layout/) of this walkthrough, you learned how to create a log in page that allows your Experience Users to authenticate against your custom experience. This part will expand your experience to include a custom home page that only logged in users can see.

![Home Page Screenshot](/images/experiences/walkthrough/views/home-page/screenshot.png "Home Page Screenshot")

The first step in building the home page is to create the `/` endpoint.

![Home Endpoint](/images/experiences/walkthrough/views/home-page/home-endpoint.png "Home Endpoint")

Set the `Method / Route` to `/` and set the `Access Control` to `All public users`. The reason we didn't limit access to only authenticated users is because we want to redirect users to the log in page if they're not logged in. This redirect needs to be done in the workflow. If we prevent access to unauthenticated users, the request will be blocked by Losant before it reaches any of our workflows and the user will receive an error message.

Next, create a new page that will be returned by this endpoint request.

![Home Content](/images/experiences/walkthrough/views/home-page/home-content.png "Home Content")

Set the `Layout` to the layout you created in part 1 of this walkthrough and set the `Page Type` to `Custom`. You can get the content for this example <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/home-page/home.hbs" target="_blank">from GitHub</a>. Feel free to copy/paste that into your new page.

This home page example is mostly Twitter Bootstrap markup for laying out the content. There is only one special section at the top.

```html
{{#fillSection "metaDescription"}}This is an example home page for your application experience.{{/fillSection}}
```

Just like what you saw with the log in page, this page is also using the [fillSection](/experiences/views/#fillsection-helpers) Handlebars helper to set the page's description in the layout's header.

Now that the endpoint and page are created, you can now create the workflow that will respond to the endpoint request with this newly created page.

Create a new workflow, <a href="https://cdn.rawgit.com/Losant/experience-views-walkthrough/107a5378/home-page/endpoint-home.flow" target="_blank">download the example</a>, and [import it](/workflows/overview/#import-export) it.

![Home Workflow](/images/experiences/walkthrough/views/home-page/home-workflow.png "Home Workflow")

Similar to the log in workflow we created previously, two of these nodes will have errors when they're imported. Update the `GET /` trigger and set the `Endpoint Method / Route` to the endpoint you just created. Next, update the `Render Home` reply node and set the `Page ID Template` to the home page you just created.

When the `/` endpoint is requested this workflow will be trigger and performs the following tasks:

* It first checks to see if the user is logged in. If the user is not logged in, the workflow replies with a redirect to the log in page.
* If the user is logged in, it replies with the home page content we just created.

You can see now why we wanted the the `/` endpoint to be available to all public users. If we restricted it to only authenticated users, this workflow would never trigger, and we wouldn't be able to redirect them to the log in page.

You can now deploy this workflow and test your example experience. If you request the `/` route while not logged in, you'll be redirected to `/login`. At that point you can log in and then you'll be redirected back to `/` to view your home page content.

This completes this part of the walkthrough. The following parts of this walkthrough will begin adding additional functionality that is common to most web pages.

[Continue to Part 4 - User Registration](/experiences/walkthrough/views/user-registration/)
