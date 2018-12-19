---
description: Follow along as we build a home page for a Losant Experience.
---

# Part 3 - Home Page

In the [previous part](/experiences/walkthrough/views/page-layout/) of this walkthrough, you learned how to create a login page to allow your Experience Users to authenticate against your custom experience. This part will expand your experience to include a custom home page that only logged-in users can see.

![Home Page Screenshot](/images/experiences/walkthrough/views/home-page/screenshot.png "Home Page Screenshot")

The first step in building the home page is to create the view with the content.

![Home Content](/images/experiences/walkthrough/views/home-page/home-content.png "Home Content")

Set the `Layout` to the layout you created [earlier](/experiences/walkthrough/views/page-layout/) in this walkthrough and set the `Page Type` to `Custom`. You can get the content for this example <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/home-page/home.hbs" target="_blank">from GitHub</a>; copy/paste that into your new page.

This home page example is mostly Twitter Bootstrap markup for laying out the content, plus a [`{{#fillSection}}` helper](/experiences/views/#fillsection-helpers) similar to what was part of the [Log In](/experiences/walkthrough/views/log-in-page/) page.

Next, create the endpoint that will be returning the page we just created.

![Home Endpoint](/images/experiences/walkthrough/views/home-page/home-endpoint.png "Home Endpoint")

Set the `Method / Route` to `/` and set the `Access Control` to `Any authenticated user`. We are going to use some built in endpoint features that we have not talked about yet for this endpoint, called static replies. When your endpoint does not need complicated logic, you can use static replies to immediately redirect or render a page (and so you don't need to create a workflow).

![Home Endpoint Static Replies](/images/experiences/walkthrough/views/home-page/home-endpoint-static.png "Home Endpoint Static Replies")

In this case, there are two static replies - one for when there is an authenticated user, and one for when there is not. In the case where there is no authenticated user - the `Unauthorized Reply` - we are choosing to redirect to `/login`, to force the user to log in. In the case where there *is* an authenticated user, we are choosing to reply directly with the page that we created above, the `Home Page`.

Now that the page and endpoint with static replies are created, your home page route will work. If you request the `/` route while not logged in, you'll be redirected to `/login`. At that point you can log in and then you'll be redirected back to `/` to view your home page content.

This completes this part of the walkthrough. The following parts of this walkthrough will begin adding additional functionality that is common to most web pages.

Continue to **[Part 4 - User Registration](/experiences/walkthrough/views/user-registration/)**
