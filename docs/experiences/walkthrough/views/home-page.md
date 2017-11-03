# Part 3 - Home Page

In the [previous part](/experiences/walkthrough/views/page-layout/) of this walkthrough, you learned how to create a login page to allow your Experience Users to authenticate against your custom experience. This part will expand your experience to include a custom home page that only logged-in users can see.

![Home Page Screenshot](/images/experiences/walkthrough/views/home-page/screenshot.png "Home Page Screenshot")

The first step in building the home page is to create the `/` endpoint.

![Home Endpoint](/images/experiences/walkthrough/views/home-page/home-endpoint.png "Home Endpoint")

Set the `Method / Route` to `/` and set the `Access Control` to `All public users`. The reason we're not limiting access to only authenticated users is because we want to redirect users to the Log In page if they're not logged in. This redirect needs to be done in the workflow. If we prevent access to unauthenticated users, the request will be blocked by Losant before it reaches any of our workflows and the user will receive an error message.

Next, create a new page that will be returned by this endpoint request.

![Home Content](/images/experiences/walkthrough/views/home-page/home-content.png "Home Content")

Set the `Layout` to the layout you created [earlier](/experiences/walkthrough/views/page-layout/) in this walkthrough and set the `Page Type` to `Custom`. You can get the content for this example <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/home-page/home.hbs" target="_blank">from GitHub</a>; copy/paste that into your new page.

This home page example is mostly Twitter Bootstrap markup for laying out the content, plus a [`{{#fillSection}}` helper](/experiences/views/#fillsection-helpers) similar to what was part of the [Log In](/experiences/walkthrough/views/log-in-page/) page.

Now that the endpoint and page are created, you can create the workflow that will respond to the endpoint request with this newly created page.

Create a new workflow, <a href="https://cdn.rawgit.com/Losant/experience-views-walkthrough/107a5378/home-page/endpoint-home.flow" target="_blank">download the example</a>, and [import it](/workflows/overview/#import-export).

![Home Workflow](/images/experiences/walkthrough/views/home-page/home-workflow.png "Home Workflow")

Similar to the login workflow we created previously, two of these nodes will have errors when they're imported. Update the `GET /` trigger and set the `Endpoint Method / Route` to the endpoint you just created. Next, update the `Render Home` reply node and set the `Page ID Template` to the home page you just created.

When the `/` endpoint is requested this workflow will be triggered, performing the following tasks:

* It first checks to see if the user is logged in. If the user is not logged in, the workflow replies with a redirect to the Log In page.
* If the user is logged in, it replies with the home page content we just created.

You can see now why we wanted the the `/` endpoint to be available to all public users. If we restricted it to only authenticated users, this workflow would never trigger, and we wouldn't be able to redirect them to the Log In page.

You can now deploy this workflow and test your example experience. If you request the `/` route while not logged in, you'll be redirected to `/login`. At that point you can log in and then you'll be redirected back to `/` to view your home page content.

This completes this part of the walkthrough. The following parts of this walkthrough will begin adding additional functionality that is common to most web pages.

Continue to **[Part 4 - User Registration](/experiences/walkthrough/views/user-registration/)**
