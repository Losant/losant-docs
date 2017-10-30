# Experience Views

Experience Views allow you to build custom web interfaces on top of your connected device data and present those interfaces to your [Experience Users](/experiences/users/). Views are rendered as a reply to an [Experience Endpoint](/experiences/endpoints/), and the data backing your views comes from a Losant [workflow](/workflows/overview/).

Through the combination of endpoints, workflows, views and users, it is possible to build completely custom, web-based, user-specific solutions entirely within the Losant platform.

## Viewing Experience Views

![Experience Views List](/images/experiences/views-overview.png "Experience Views List")

Views are listed within the "Views" tab of your application's "Experience" subsection. Here you will see a heading for each type of view and a list of views of that type beneath it. Click the name of any view to edit it.

## Adding an Experience View

From the Views list page, click the "Add" button next to the list heading for the type of view you would like to create. A view's type is **not editable** after creation; if you would like to change a view's type, you will have to create a new view of the type and copy the contents from the old view to the new one.

![Create Experience View](/images/experiences/views-add.png "Create Experience View")

Views are built as a combination of HTML and [Handlebars templates](http://handlebarsjs.com/). There are three types of Experience Views; each serves a distinct purpose, and each is configured in a different way.

## Layouts

Layouts are "wrappers" in which pages are rendered. Most application experiences will only use a couple layouts, as most customizations to a layout that would be applied on a per-page basis can be accomplished using [`{{section}}` tags](#section-tags).

### Configuration

![Layout Configuration](/images/experiences/views-layout-config.png "Layout Configuration")

A layout takes the following configuration options:

*   **Name:** The name of the layout. This is required and it must be unique across your application.
*   **Description:** An optional description of the layout. This is never displayed to end users.
*   **Content:** The combination of markup and Handlebars tags used to render the layout. This can include [`{{section}}` tags](#section-tags) and [components](#components), and it must include one [`{{page}}` tag](#the-page-tag).

<h4 id="the-page-tag">The <span style="text-transform:none;">{{page}}</span> Tag</h4>

Your layout **must** include a single `{{page}}` tag somewhere within it. Wherever the tag is included is where the [Experience Page](#pages) using the layout will be rendered.

<h4 id="section-tags"><span style="text-transform:none;">{{section}}</span> Tags</h4>

Your layout may optionally include multiple `{{section}}` tags, which are blocks within the layout whose contents may be filled in by the page referencing the layout, or by components used within the page.

A section is defined as such, where "mySectionName" is a unique name within the layout:

```hbs
{{section "mySectionName"}}
```

To include **default section content** to render in the event that neither the child page nor any component fills the section, define the section like so:

```hbs
{{#section "mySectionName"}}Default Content{{/section}}.
```

The section's contents is then defined in subsequent pages and their components using a [`{{#fillSection}}` tag](#fillsection-tags).

### Using Layouts

Layouts are chosen as an optional property of an Experience Page, though a page's layout can be overridden within the [Endpoint Reply workflow node](/workflows/outputs/endpoint-reply/) on a per-endpoint-request basis.

Layouts are optional within your application experience. However, if you choose not to define a layout for any page, that page should include all the necessary markup to properly render a web page (your `doctype` declaration, etc.).

### Example Layout

A layout includes common elements that are used in all web pages you are rendering within your experience; for example, a typical should include the following:

*   Your `<!doctype html>` declaration
*   The HTML `<head>` as well as any common `<script>` and `<link>` (stylesheet) tags
*   Your opening and closing `<body>` tags
*   Common UI elements that do not change per page, such as your header and footer

Here is an example of everything a layout should include:

```hbs
<!doctype html>
  <html lang="">
  <head>
    <meta charset="utf-8">
    <title>{{#section "pageTitle"}}Welcome{{/section}} | My Experience</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Stylesheets should be included in the head, and they must be served from a third-party CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- we can add per-page styles using a {{#fillSection}} tag within a page -->
    {{section "pageStyles"}}
  </head>
  <body>
    <div class="wrapper">
      {{ component "mainNav" }}
      <!-- the page's content renders here -->
      {{ page }}
      {{ component "footer" }}
    </div>
    <!-- some scripts that are used on all pages can be included here -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- we can include scripts specific to the page using a section -->
    {{section "pageScripts"}}
  </body>
</html>
```

## Pages

Pages are the fundamental Experience View type; without a page, it is impossible to render a custom user interface on top of your application data. You can have a single page for every [endpoint](/experiences/endpoints/) in your application, or you can define pages that are used as templates for rendering specific types of data (e.g. a list of resources).

### Configuration

![Page Base Configuration](/images/experiences/views-page-base-config.png "Page Base Configuration")

A page takes the following configuration options:

*   **Name:** The name of the page. This is required and it must be unique across your application.
*   **Description:** An optional description of the page. This is never displayed to end users.
*   **Layout:** The layout in which this page should be rendered. If you do not provide a layout, the page will be rendered without one (in which case you should choose "Custom" for your page type and, in the page content, provide a `doctype` and other tags necessary to render HTML in a browser.) If you choose a layout, your page will render at the location of [the `{{page}}` tag](#the-page-tag) within the layout.
*   **Page Type:** Choose either "Custom" or "Dashboard". More info on each page type is available below.

#### Custom Pages

![Page Custom Configuration](/images/experiences/views-page-custom-config.png "Page Custom Configuration")

Custom pages are configured much the same way [layouts](#layouts) and [components](#components) are: by providing a mix of HTML and [Handlebars](http://handlebarsjs.com) to reference the data passed down to the page. You may include any [view components](#components) within your page content, in addition to providing [`{{#fillSection}}` tags](#fillsection-tags) for setting the contents of [`{{section}}` tags](#section-tags) defined within a [layout](#layouts).

#### Dashboard Pages

The "Dashboard" page type makes it easy to render any dashboard that is also owned by your application's owner. This can be useful for adding some custom branding around your dashboard and also for controlling access to the dashboard (as well as default [context settings](/dashboards/context-variables/)) using the [Experience Users](/experiences/users/) feature.

![Page Dashboard Configuration](/images/experiences/views-page-dashboard-config.png "Page Dashboard Configuration")

A dashboard page takes the following additional configuration options:

*   **Dashboard:** The dashboard to render. This can be a specific dashboard or a Handlebars tag referencing a dashboard ID in the [context](#referencing-context) provided to your page.
*   **Time:** The time (in [Unix time](https://en.wikipedia.org/wiki/Unix_time)) to render each block at. This can either be a specific time or a reference to a context property. Providing no time will default the dashboard to the current time. (Read more about [viewing past dashboard states](/dashboards/overview/#viewing-past-dashboard-states).)
*   **Theme:** Whether to render the dashboard in the "Light" or "Dark" theme.
*   **Context:** The [context variables](/dashboards/context-variables/) to pass down to the dashboard. If you chose a specific dashboard, you will see all the context variables defined for the dashboard and will have the option of setting a value for each. If you referenced an ID from the page's context, you must defined each key and value you wish to pass down. In both cases, the value can be a static value or a reference to a page context property.

### Using Pages

In order to use a page, you must do the following:

1.   Define an [Experience Endpoint](/experiences/endpoints/) for your users to visit.
2.   Build a [workflow](/workflows/overview/) to handle the endpoint request and issue a response. (You can do this [automatically](/experiences/endpoints/#endpoints-and-workflows) from the endpoint's edit page.)
3.   Choose "Experience Page" as the "Reply Type" in the [Endpoint Reply node](/workflows/outputs/endpoint-reply/#reply-type) and select your page as the one to render for the user.

In the Endpoint Reply node, you may optionally [construct a `pageData` object](/workflows/outputs/endpoint-reply/#reply-type) to supply to the page. Note that there are a number of context properties [available automatically](#data-that-is-always-provided), in addition to the `pageData` you may provide through the workflow.

### Example Page

Given the [example layout](#example-layout) defined above, a typical [custom page](#custom-pages) body may look like this:

```hbs
{{#fillSection "pageTitle"}}
  This Is My Page Title
{{/fillSection}}

<!-- this content will populate the {{page}} tag within the layout -->
<div class="content">
  <h1>Hello there, {{experience.user.firstName}}!</h1>
  <p>You have access to the following devices:</p>
  <ul>
    {{#each pageData.devices}}
      {{component "deviceLink"}}
    {{/each}}
  </ul>
</div>
<!-- end page content. fillSections are removed from the document flow; their order and placement within the page does not matter. -->

{{#fillSection "pageStyles"}}
  <style type="text/css">
    .wrapper { width: 100%; } /* this page should be full-width */
  </style>
{{/fillSection}}
```

## Components

Components are snippets of HTML and Handlebars that can be used within your layouts, pages or other components. Often components are invoked multiple times per page – such as when iterating over a list of items – but they can also be used simply as a means of cleaning up your code (for example, creating a component housing your experience's navigation code and referencing it one time in your layout).

### Configuration

![Component Configuration](/images/experiences/views-component-config.png "Component Configuration")

Components take the following properties:

*   **Name:** The name of the component. This is required and it must be unique across your application.
*   **Description:** An optional description of the component. This is never displayed to end users.
*   **Content:** The combination of markup and Handlebars tags used to render the component. This can include [`{{#fillSection}}` tags](#fillsection-tags) as well as other components.

<h4 id="fillsection-tags"><span style="text-transform:none;">{{#fillSection}}</span> Tags</h4>

The contents of any [`{{section}}` tag](#section-tags) defined within a layout can be filled by including a `{{#fillSection}}` block helper within a page (or a component referenced within a page). The tag can be placed anywhere within that view, and its contents are removed from the rendering flow of the view and pushed to the layout. You can see examples of `{{#fillSection}}` tags being used in the [example page](#example-page) and [example layout](#example-layout) provided above.

Given a `{{section "mySectionName"}}` tag defined within a layout, its contents would be populated by including the following in your page or component:

```hbs
{{#fillSection "mySectionName"}}
  This content will be placed at the spot of "mySectionName" in the layout!.
{{/fillSection}}
```

When working with `{{#fillSection}}` tags, keep the following rules in mind:

*   `{{#fillSection}}` tags may be placed within [pages](#pages), or within [components](#components) that are called within those pages. If a component is referenced directly from a [layout](#layouts), its `{{#fillSection}}` declarations (and any `{{#fillSection}}` declarations from components referenced by that component) will be ignored.
*   When multiple `{{#fillSection}}` tags attempt to set the content of the same `{{section}}` (as in, when both a page and a component reference the same section name in a `{{#fillSection}}` declaration), the last declaration the renderer sees is the one that will populate the `{{section}}`. For this reason, it is a good idea to put a `{{#fillSection}}` tag at the bottom of your page's content to ensure it is no overridden by any child component (unless, of course, that is the desired behavior).

### Using Components

Components can be included within [layouts](#layouts), [pages](#pages) and other components. To render a component with the name "componentName", place the following tag where you would like the component to render:

```hbs
{{component "myComponentName"}}
```

#### Passing Custom Context

By default, a component has access to the entire [page context object](#referencing-context) when it is invoked as `{{component "myComponentName"}}`. However, it is possible to specify the context passed down to a component by adding a third argument:

```hbs
{{component "myComponentName" pageData.myComponentContext}}
```

When passing context to a component, the passed context will become primary data available to the component. Its root value can be referenced with a period (`{{.}}`). If you wish to use the full context supplied to the page in this scenario, you must reference it under the ["@root" property](http://handlebarsjs.com/reference.html#data-root).

### Example Components

In our [example page](#example-page), we referenced a "deviceLink" component that was inside an `{{#each}}` loop. In such a use case, the current iteration of the loop is the default context passed to the page; however, as mentioned above, one may still reference the top-level context using a `@root` property.

With that in mind, the "deviceLink" component may look like the following (with an "active" class included on the link to the current URL):

```hbs
<li class="{{#eq @root.request.params.deviceId id}}active{{/eq}}"><a href="/devices/{{id}}">{{name}}</a></li>
```

A component can also be a one-time use snippet that is called directly from a layout. In these cases, their use is more for code cleanup and readability than anything else. Given our [example layout](#example-layout), our "footer" component may look like the following:

```hbs
<hr />
<div class="footer">
  &copy; 2017. All rights reserved.
</div>
```

## Referencing Context

Data passed down to your views can be referenced using standard [Handlebars paths](http://handlebarsjs.com/#paths). It is through this method that different user interfaces can be provided depending on the user requesting the page, the endpoint being viewed and the data returned by your backing workflow.

### Data That is Always Provided

The following data is available in your root context from any layout, page or component:

```javascript
{
  time, // the time of the request
  application, // object containing the application name and ID
  experience: {
    user, // object containing info on the user who made the request (if available)
    endpoint, // object containing info on the endpoint config
    page, // object containing info on the page config
    layout // object containing info on the layout config
  },
  flow, // object containing the backing workflow's name, ID and version
  globals, // key/value mapping of any global variables from the application / workflow
  request: {
    path, // the actual request path
    method, // request method (e.g. get, post, patch, delete)
    headers, // object with header names as keys and their values mapped to them
    params, // object with path params as keys and their values mapped to them
    query, // object with query params as keys and their values mapped to them
    body, // request body (if applicable, e.g. in a post or patch request)
    cookies // object with cookie names as keys and their values mapped to them
  },
  pageData // object containing the custom data passed down from the workflow
}
```

<h4 id="the-pagedata-property">The <span style="text-transform:none;">pageData</span> Property</h4>

When replying to your endpoint request with an experience page, you have the option of passing additional information down to the view; that data is generated by the workflow replying to the request. All of that data is available under the `pageData` property within the view's context.

## Deleting Experience Views

A view can be deleted by clicking the "Delete" icon next to any view on the list page, or by clicking the "Delete" button in the footer of a view's edit page.

### Take Care When Deleting Views

If you delete a page, any endpoint replies referencing that page **will fail to load** until you update its [Endpoint Reply node](/workflows/outputs/endpoint-reply/) to reference an existing page. **The same is true for layouts** referenced by a page or overridden within an Endpoint Reply node.

Deleted or renamed components will **not** cause the endpoint to fail; rather, the view will simply render no content in the spot where the offending component was referenced.
