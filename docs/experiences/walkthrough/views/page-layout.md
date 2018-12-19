---
description: Follow along as we create a page layout for a Losant Experience.
---

# Part 1 - Page Layout

An Experience View's [layout](/experiences/views/#layouts) holds elements and visuals that are common across all pages in your custom experience. This is typically one of the first things you'll create before building any other components or pages.

For this walkthrough, the layout that we'll be building looks like the following image.

![Blank Layout](/images/experiences/walkthrough/views/page-layout/blank-layout.png "Blank Layout")

This layout includes a header and a footer. The header includes a logo, a few placeholder navigation links, and a "Log In" link. The footer includes a copyright statement. The blank space in the middle is where individual pages will be rendered within this layout.

The Experience Views functionality can be found under the "Views" tab in the "Experience" section of Losant.

![Views Tab](/images/experiences/walkthrough/views/page-layout/views-tab.png "Views Tab")

In many cases, you might have resources already created as part of the [automatic setup](/experiences/overview/#initial-setup). The screenshots throughout this guide are starting from a blank experience and are building up the same example that is auto-generated for you.

Within the Views tab, you'll see three types of resources: [Layouts](/experiences/views/#layouts), [Pages](/experiences/views/#pages), and [Components](/experiences/views/#components). To create your Layout, click the Add button above the Layouts list.

![Add Layout](/images/experiences/walkthrough/views/page-layout/add-layout.png "Add Layout")

After you click the Add button, you'll be presented with a blank layout. Every layout requires a name and some content.

![Layout Content](/images/experiences/walkthrough/views/page-layout/layout-content.png "Layout Content")

The example content can be <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/page-layout/layout.hbs" target="_blank">found on GitHub</a>. Feel free to copy/paste that into your newly created layout.

Layouts are defined as HTML and <a href="http://handlebarsjs.com/" target="_blank">Handlebars templates</a>. You can define a layout with any content you'd like. In this example, <a href="https://getbootstrap.com/docs/3.3/" target="_blank">Twitter Bootstrap</a> is used since it provides responsive scaffolding and common elements found on most web pages. Bootstrap, however, is not required. If you're more comfortable with a different front-end framework, feel free to swap it out for whatever you'd like. **Note**, however, that the remainder of this walkthrough is written assuming you are using Bootstrap as your framework.

Most of the HTML in the example layout is simply markup for laying out the content. However, there are important concepts that need to be explained further. The first is a template that can found in the header's title tag.

```html
<title>{{ experience.page.name }} | My Experience</title>
```

Every time a page is rendered, some amount of context is provided that you can use inside your page or layout. [Some fields are guaranteed](/experiences/views/#data-that-is-always-provided), like those found on the `experience` object. Custom data, which is provided by the workflow that's handling the current page request, will be found on the `pageData` object. In this example, the page's title defaults to the name of whatever page is being rendered. For example, if the page that's being rendered inside this layout has a name of "Log In", the title of the page will be "Log In | My Experience". You'll at least want to change "My Experience" to something relevant to your use case.

Immediately below the title is a tag for the description.

```html
<meta name="description" content="{{section 'metaDescription'}}">
```

This uses a special [section helper](/experiences/views/#section-helpers). A section defines a placeholder that can be filled by the page being rendered within this layout. In this case, we want the override the description meta tag on a per-page basis. You'll see this being use in later parts of this walkthrough.

The next thing you'll want to change is the logo at the top left of the page.

```html
<a class="navbar-brand" href="/" style="padding-top:0; padding-bottom:0;">
  <img alt="Logo"
       style="margin-top:13px; height: 24px;"
       src="https://app.losant.com/images/embree/embree_sm.png">
</a>
```

This is a placeholder image provided as part of the example. To replace this image, you'll need to upload your logo somewhere, such as [Files](/applications/files/) or <a href="https://aws.amazon.com/s3/" target="_blank">Amazon S3</a>, and replace the `src` attribute with the new URL. Alternatively, you can [Base64 encode](https://www.base64-image.de/) the image and place it directly in the layout.

The next item you may notice is the `userIndicator` component, which provides the "Log In" link in the top right corner of the page. This will toggle between a "Log In" link and a dropdown menu displaying the user's first name based on whether a user is logged in.

```html
{{component "userIndicator"}}
```

[Components](/experiences/views/#components) provide a way to group and reuse page elements. Components are added to a page or layout using the special `component` Handlebars helper. The name of the component is then used to control which component should be placed on the page. In this example, the component's name is "userIndicator". Let's create that component now.

A new component can be created by clicking the Add button at the top of the Components list.

![Add Component](/images/experiences/walkthrough/views/page-layout/add-component.png "Add Component")

Just like with layouts, components require a name and some content.

![Component Content](/images/experiences/walkthrough/views/page-layout/component-content.png "Component Content")

You can get the content for this example <a target="_blank" href="https://github.com/Losant/experience-views-walkthrough/blob/master/page-layout/userIndicator.hbs">from GitHub</a>. Since this component is fairly small, its content is also below. Copy/paste this into your new component.

```html
<ul class="nav navbar-nav navbar-right">
  {{#if experience.user}}
    <li class="dropdown">
      <a href="#"
        class="dropdown-toggle"
        data-toggle="dropdown"
        role="button"
        aria-haspopup="true"
        aria-expanded="false">
         {{experience.user.firstName}}
        <span class="caret"></span></a>
      <ul class="dropdown-menu">
        <li><a href="/logout">Log Out</a></li>
      </ul>
    </li>
  {{else}}
    <li><a href="/login">Log In</a></li>
  {{/if}}
</ul>
```

If the user is logged in, a `user` object is automatically placed on the context for you. This component is checking for that object to determine what to display. If there is no user object, it displays a "Log In" link. If the user object does exist, it displays the user's first name using the `experience.user.firstName` property and adds a menu item to log out.

That's it for this component. Let's now return to the layout. Next you'll see the special `page` Handlebars helper after the user indicator component we just built.

```html
{{ page }}
```

The [page helper](/experiences/views/#the-page-helper) defines where the page should render within this layout. Every layout requires a `page` helper to be defined somewhere. We'll be creating pages in subsequent parts of this walkthrough.

The last component on the page, `gaTracking` is used to add <a href="http://analytics.google.com/" target="_blank">Google Analytics</a> tracking to this custom web experience.

```html
{{component "gaTracking" "UA-XXXXX-X"}}
```

To use this component, replace `UA-XXXXX-X` with your specific tracking ID that is provided by Google Analytics. Create a new component and name it `gaTracking`.

![Google Analytics Tracking Component](/images/experiences/walkthrough/views/page-layout/ga-tracking-component.png "Google Analytics Tracking Component")

The contents of this component can be <a href="https://github.com/Losant/experience-views-walkthrough/blob/master/page-layout/gaTracking.hbs" target="_blank">found on GitHub</a> and are also displayed below.

```html
<script>
  (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
  function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
  e=o.createElement(i);r=o.getElementsByTagName(i)[0];
  e.src='//www.google-analytics.com/analytics.js';
  r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
  ga('create','{{.}}','auto');ga('send','pageview');
</script>
```

This code is provided by Google Analytics, so it won't be explained as part of this walkthrough. The important thing to notice is the following line and the `{{.}}` template.

```javascript
ga('create','{{.}}','auto');ga('send','pageview');
```

When this component was used in the page layout, the tracking ID was provided as a [second argument](/experiences/views/#passing-custom-context) to the `component` helper. If you provide any data this way, the entire context for this component is replaced by whatever value you supply. This means we can now reference the tracking ID by simply using the ``{{.}}`` template. In Handlebars, a dot refers to the entire context object, which in this case is just a string representing the tracking ID that was passed in.

At this point, you now have a complete layout with two components. The next section of this walkthrough covers adding a "Log In" page that will be rendered within this layout.

**Continue to [Part 2 - Log In Page](/experiences/walkthrough/views/log-in-page/)**
