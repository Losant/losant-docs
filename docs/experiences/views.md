# Experience Views

Experience Views allow you to build custom web interfaces on top of your connected device data and present those interfaces to your [Experience Users](/experiences/users/). Views are accessed through [Experience Endpoints](/experiences/endpoints/), and the data backing your interfaces comes from a Losant [workflow](/workflows/overview/).

Through the combination of endpoints, workflows, views and users, it is possible to build web-based custom, user-specific solutions entirely within the Losant platform.

## Viewing Experience Views

Users are listed within the "Views" tab of your application's "Experience" subsection. Here you will see a heading for each [type of view](#view-types) and a list of views of that type beneath it. Click the name of any view to edit it.

## Adding an Experience View

From the Views list page, click the "Add" button next to the list heading for the type of view you would like to create. A view's type is **not editable** after creation; if you would like to change a view's type, you will have to create a new view of the type and copy the contents from the old view to the new one.

Views are built as a combination of HTML and [Handlebars string templates](/workflows/accessing-payload-data/#string-templates) tags. There are three types of Experience Views; each serves a distinct purpose, and each is configured in a different way.

## Layouts

Layouts are "wrappers" in which pages are rendered. A layout includes common elements that are used in all web pages you are rendering within your experience; for example, a typical would include the following:

*   Your `<!DOCTYPE html>` declaration
*   The HTML `<head>` as well as any common `<script>` and `<link>` (stylesheet) tags
*   Your opening and closing `<body>` tags
*   Common UI elements that do not change per page, such as your header and footer

Most application experiences will only use a couple layouts, as most customizations to a layout that would be applied on a per-page basis can be accomplished using [`{{section}}` tags](#section-tags).

A layout takes the following configuration options:

*   **Name:** The name of the layout. This is required and it must be unique across your application.
*   **Description:** An optional description of the layout. This is never displayed to end users.
*   **Content:** The combination of markup and Handlebars tags used to render the layout.

<h3 id="the-page-tag">The <span style="text-transform:none;">{{page}}</span> Tag</h3>

Your layout **must** include a single `{{page}}` tag somewhere within it. Wherever the tag is included is where the [Experience Page](#pages) using the layout will be rendered.

<h3 id="section-tags"><span style="text-transform:none;">{{section}}</span> Tags</h3>

Your layout may optionally include multiple `{{section}}` tags, which are blocks within the layout whose contents may be filled in by the page referencing the layout, or by components used within the layout itself or its page.

A section is defined as such: `{{section "mySectionName"}}`, where "mySectionName" is a unique name within the layout. To include **default section content** to render in the event that neither the child page nor any component fills the section, define the section like so: `{{#section "mySectionName"}}Default Content{{/section}}`.

The section's contents is then defined subsequent pages and components using a [`{{#fillSection}}` tag](#fillsection-tags).

### Using Layouts

Layouts are chosen as a property of a page, though a page's layout can be overridden within the [Endpoint Reply workflow node](/workflows/outputs/endpoint-reply/).

Layouts are optional within your application experience and on a per-page basis. However, if you choose not to define a layout for any page, that page should include all the necessary markup to properly render a web page (your `DOCTYPE` declaration, etc.).

## Pages

Pages are the fundamental Experience View type; without a page, it is impossible to render a custom user interface on top of your application data. You can have a single page for every [endpoint](/experiences/endpoints/) in your application, or you can define pages that are used as templates for rendering specific types of data (e.g. a list of resources).

A page takes the following configuration options:

*   **Name:** The name of the page. This is required and it must be unique across your application.
*   **Description:** An optional description of the page. This is never displayed to end users.
*   **Layout:** The layout in which this page should be rendered. If you do not provide a layout, the page will be rendered without one (in which case you should choose "Custom" for your page type and, in the page content, provide a `DOCTYPE` and other tags necessary to render HTML in a browser.) If you choose a layout, your page will render at the location of [the `{{page}}` tag](#the-page-tag) within the layout.
*   **Page Type:** Choose either "Dashboard" or "Custom". More info on each page type is available below.

### Custom Pages

Custom pages are configured much the same way [layouts](#layouts) and [components](#components) are: by providing a mix of HTML and [Handlebars string templates](/workflows/accessing-payload-data/#string-templates) to reference the data passed down to the page. You may include any [view components](#components) within your page content, in addition to providing [`{{#fillSection}} tags`](#fillsection-tags) for setting the contents of [`{{section}} tags`](#section-tags) defined within a [layout](#layouts).

### Dashboard Pages

The "Dashboard" page type makes it easy to render any dashboard that is also owned by your application's owner. This can be useful for adding some custom branding around your dashboard and also for controlling access to the dashboard using the [Experience Users](/experiences/users/) feature.

A dashboard page takes the following configuration options:

*   **Dashboard:** The dashboard to render. This can be a specific dashboard or a Handlebars tag referencing a dashboard ID in the [context](#referencing-context) provided to your page.
*   **Time:** The time (in [Unix time](https://en.wikipedia.org/wiki/Unix_time)) to render each block at. This can either be a specific time or a reference to a context property. Providing no time will default the dashboard to the current time. (Read more about [viewing past dashboard states](/dashboards/overview/#viewing-past-dashboard-states).)
*   **Theme:** Whether to render the dashboard in the "Light" or "Dark" theme.
*   **Context:** The [context variables](/dashboards/context-variables/) to pass down to the dashboard. If you chose a specific dashboard, you will see all the context variables defined for the dashboard and will have the option of setting a value for each. If you referenced an ID from the page's context, you must defined each key and value you wish to pass down. In both cases, the value can be a static value or a reference to a page context property.

### Using Pages

In order to use a page, you must do the following:

1.   Define an [Experience Endpoint](/experiences/endpoints/) for your users to visit.
2.   Build a [workflow](/workflows/overview/) to handle the endpoint request and issue a response. (You can do this [automatically](/experiences/endpoints/#endpoints-and-workflows) from the endpoint's edit page.)
3.   Choose "Experience Page" as the "Reply Type" in the [Endpoint Reply node](/workflows/outputs/endpoint-reply/#reply-type) and select your page as the one to render for the user.

In the Endpoint Reply node, you may optionally [construct a context object](/workflows/outputs/endpoint-reply/#reply-type) to supply to the page. Note that there are a number of context properties [available automatically](#data-that-is-always-provided), in addition to any context you may provide through the workflow.

## Components

Components are snippets of HTML and Handlebars that can be used within your layouts, pages or other components. Often components are invoked multiple times per page – such as when iterating over a list of items – but they can also be used simply as means of cleaning up your code (for example, creating a component housing your experience's tracking code and referencing it one time in your layout).

### Passing Custom Context

By default, a component has access to the entire [page context object](#referencing-context) when it is invoked as `{{component "myComponentName"}}`. However, it is possible to specify the context passed down to a component by adding a third argument: `{{component "myComponentName" pageData.myComponentContext}}`.

When passing context to a component, the passed context will become the only data available to the component. The root value passed down to the component can be referenced with a period (`{{.}}`).

<h3 id="fillsection-tags">The <span style="text-transform:none;">{{#fillSection}}</span> Tags</h3>

## Referencing Context

### Data That is Always Provided

## Deleting Experience Views

A view can be deleted by clicking the "Delete" icon next to any view on the list page, or by clicking the "Delete" button in the footer of a view's edit page.

### Take Care When Deleting Views

If you delete a page, any endpoint replies referencing that page **will fail to load** until you update its [Endpoint Reply node](/workflows/outputs/endpoint-reply/) to reference an existing page. **The same is true for layouts** referenced by a page or overridden within an Endpoint Reply node.

Deleted or renamed components will **not** cause the endpoint to fail; rather, the view will simply render no content in the spot where the offending component was referenced.
