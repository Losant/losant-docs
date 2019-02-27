---
description: Learn more about creating end user experiences in the Losant platform.
---

# Experiences

Building a product on top of Losant would normally involve writing an API service, implementing user authentication, building and serving a front-end interface, and hosting all of the above somewhere – which is a lot of work! Experiences bring all of this functionality directly inside your Losant application.

Experiences are a means by which you can build a fully functional web interface, allowing users to interact with your connected [devices](/devices/overview/). Set a subdomain at which your [custom views](/experiences/views/) can live; return [user-specific dashboards](/experiences/views/#dashboard-pages) with content that is specifically relevant to them; configure [endpoints](/experiences/endpoints/) to respond to requests using the power of Losant's [workflow engine](/workflows/overview/); register [users](/experiences/users/) against your application; and protect data access by assigning your users to [groups](/experiences/groups/).

![Experiences Overview](/images/experiences/overview-overview.png "Experiences Overview")

Experience resources are subject to account [resource limits](/organizations/resource-limits/), with all but the Users being [soft limits](/organizations/resource-limits/#soft-limited-resources) (meaning you may request increases to these limits at potentially zero additional charge). If you need to register additional Experience Users, you will have to upgrade to an [organization](/organizations/overview/).

## Initial Setup

New applications Experiences must first go through a short bootstrapping process before you can begin using the features.

### Choose a Slug

![Bootstrap Slug](/images/experiences/overview-choose-slug.png "Bootstrap Slug")

The first step in working with Experiences is to choose a custom endpoint slug, which is a subdomain at which your endpoint requests will live. It is here that endpoint requests can be **securely** received and responded to. After initial setup, you may also configure one or more full [domains](/experiences/domains/) for handling endpoint requests as well as additional endpoint slugs.

By default, your application experience includes a slug that matches your application ID; this slug cannot be deleted. If you choose to enter a custom slug during the bootstrapping process, the slug must meet these requirements:

* Must be at least 4 characters
* May only contain lowercase letters, numbers, hyphens (-) and underscores (\_)
* Must be unique across the entire Losant Platform
* Cannot be a commonly used Internet subdomain, such as "webmail" or "cpanel"
* Cannot be profane (slugs violating this rule are subject to change without notice)

HTTP requests for your endpoints should then go to `https://[my-custom-slug].onlosant.com/[my-endpoint]`.

### Bootstrap Your Experience

After choosing a slug, you'll have the option of setting up some example resources to get you started. This step can be skipped on a per-application basis, though we recommend completing it as a great starting point for building out a full experience.

![Bootstrap Choose](/images/experiences/overview-choose-bootstrap.png "Bootstrap Choose")

If you choose to create the helper resources, Losant will automatically add the following to your application:

* Two `/login` [endpoint](/experiences/endpoints/) (one for GET and one for POST requests), a backing [workflow](/workflows/overview/) (which handles the actual authentication and routing), and the [page](/experiences/views/#pages) to render when the endpoints are requested.
* A `/logout` endpoint and a backing workflow for signing users out.
* A `/` (root) endpoint configured to render another page for signed-in users and to redirect to the login page for unauthenticated users.
* The [layout](/experiences/views/#layouts) and [components](/experiences/views/#components) necessary to render the pages listed above.
* A test [Experience User](/experiences/users/) for testing authentication and protected endpoints.
* An [Experience Group](/experiences/groups/) with the test user as a member.

The sample resources utilize a placeholder brand and a layout wrapped in [Twitter Bootstrap](https://getbootstrap.com/docs/3.3/), a popular front-end framework whose stylesheets and script files are available on a content delivery network. You are free to continuing using this framework to build out your experience, or to swap it with another of your choosing (or no framework at all).

All of these resources can be updated or deleted at any time. If you [delete all your experience resources](#deleting-experience-resources), you will have the option of running the bootstrap process again.

### Test Your Experience

Finally, if you chose to create the sample resources, you'll receive instructions for testing your new endpoints and views. Click the link provided on the summary screen, which should redirect you to your new login page. Sign in with the provided credentials and you will then see the placeholder home page.

![Bootstrap Review](/images/experiences/overview-review.png "Bootstrap Review")

**Take note of the random password assigned to your test user.** If you lose this password, you will have to [edit the user](/experiences/users/#required-fields) to reset it.

If you chose to skip the resource creation step, the modal will simply dismiss when you set your slug.

## Deleting Experience Resources

If for any reason you need to delete parts or all of your Experience, you can do so under the "Settings" > "Application info" tab in your application's sub-navigation and then selecting "Delete Resources" in the top navigation tabs. Select all the resources you wish to delete and then submit the form.

![Bulk Delete Experience Resources](/images/experiences/bulk-delete-experience-versions.png "Bulk Delete Experience Resources")