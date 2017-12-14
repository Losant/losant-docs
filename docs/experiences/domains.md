# Experience Domains

An experience domain is a custom domain at which your [experience endpoints](/experiences/endpoints/) are available on the Internet. Your application can have [multiple experience domains](#using-multiple-domains), and all of your endpoints will be accessible at each domain.

Experience domains are only available within applications owned by an organization. If you require a custom domain in front of your experience endpoints for one of your Sandbox applications, you will need to migrate that application to an organization.

## Viewing Experience Domains

![Domains Overview](/images/experiences/domains-overview.png "Domains Overview")

Domains are listed within the "Domains" tab of your application's "Experience" subsection. Click a domain name in the list to view its configuration or make edits.

## Adding an Experience Domain

![Add Experience Domain](/images/experiences/domains-add.png "Add Experience Domain")

From the Domains list page, click "Add Domain" in the top right corner. This will take you to a page where the new domain can be configured.

## Domain Configuration

Setting up an Experience Domain takes only one required field: the **Domain** itself. The domain must meet the following criteria:

- It must be comprised of **[valid characters](https://en.wikipedia.org/wiki/Domain_name#Domain_name_syntax)**.
- It must be **unique** across the entire Losant platform.
- It must originate from a **[known top-level domain](https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains)**.
- It **may** contain a **subdomain** in the form of a [wildcard](https://en.wikipedia.org/wiki/Wildcard_DNS_record) or a static name.

If you do not already have a domain, you can purchase one through a registrar such as [NameCheap](https://www.namecheap.com/domains/domain-name-search.aspx) or [GoDaddy](https://www.godaddy.com/domains/domain-name-search).

![Domain Configuration](/images/experiences/domains-configuration.png "Domain Configuration")

### Securing Your Domain

When configuring the domain, you may also include an **SSL Key** and **SSL Certificate** to secure requests to your experience endpoints. If the certificate was acquired through a non-standard issuer, you may optionally include an **SSL Bundle** containing the root and intermediate certificates.

Securing the domain is optional, though we strongly recommend it. SSL certificates can be purchased at providers such as [NameCheap](https://www.namecheap.com/security/ssl-certificates.aspx); you can also get a free SSL from [Let's Encrypt](https://letsencrypt.org/getting-started/).

After acquiring an SSL certificate, return to your experience domain and insert the Key and Certificate values, and optionally the Bundle.

### Configuring DNS Records

After you have set up the domain within Losant (and assuming you have the domain registered already), you will have to make a change to your domain's DNS records to forward all requests hitting the domain to your application experience.

1. Log in to your registrar account and navigate to the DNS settings for the domain in question. (These steps will vary depending on your registrar.)
2. Add a [CNAME DNS record](https://en.wikipedia.org/wiki/CNAME_record) ("Host") for the domain exactly as configured within Losant (e.g. potentially with a static / wildcard subdomain or none at all).
3. Set the value ("Points to") of the record to your endpoint slug **without the protocol**. For example, if you currently access your experience endpoints at `https://myslug.onlosant.com`, enter **myslug.onlosant.com** as the value.

![GoDaddy CNAME Example](/images/experiences/domains-godaddy-dns-example.png "GoDaddy CNAME Example")

The picture above is an example for configuring the CNAME record on a domain registered at GoDaddy; all registrars will have a similar interface for entering the necessary record.

It may take some time for the changes to [propagate](https://www.namecheap.com/support/knowledgebase/article.aspx/9622/10/dns-propagation--explained) after you save your work; propagation usually takes a couple hours but can take as long as 24 hours. At that point you can start issuing requests to your experience endpoints using the new domain.

## Editing the Endpoint Slug

![Edit Endpoint Slug](/images/experiences/domains-edit-endpoint-slug.png "Edit Endpoint Slug")

Back on the Experience Domains list page, you can also change the [endpoint slug](/experiences/overview/#choose-a-slug) that you defined when first configuring your application experience. Note, however, that changing this slug within an actively used application experience will cause **all requests to your endpoints to fail** until you have:

- Distributed the new endpoint slug to anybody accessing it directly, and/or ...
- Updated the [DNS settings](#configuring-dns-records) on any domains already set up within the experience.

If these warnings are not enough to scare you away from updating the endpoint slug, you may set the new slug by clicking the "Edit" button alongside the domain and entering a new value in the text box. Changes will take effect as soon as you save.

## Using Multiple Domains

You may register multiple domains against your application experience, and assuming you have configured the DNS records correctly for each domain, your endpoints will respond to requests on any of the domains.

This is useful if you wish to run multiple "brands" through one application experience, or change what is returned in an endpoint reply based on the domain from which the request originated. Within the workflow that is issuing a response to the endpoint request (via the [Experience Endpoint Trigger](/workflows/triggers/endpoint/)), the domain is available at the [payload path](/workflows/accessing-payload-data/#payload-paths) of `data.headers.host`. Depending on this value, you could (for example) ...

- Branch the workflow using a [Conditional Node](/workflows/logic/conditional/) and return a completely different result
- Return the same [Experience Page](/workflows/outputs/endpoint-reply/#experience-page-response) but change the page's layout, thus "white-labeling" your application experience for different domains
- Run a REST API at an `api` subdomain and a user interface at a `www` subdomain

## Deleting Domains

A domain can be deleted by clicking the "Delete" icon next to any domain on the list page, or by clicking the "Delete" button in the footer of a domain's edit page. Deleting an experience domain will take effect immediately, and any requests to the domain will neither return a result nor forward to your experience's other domains or endpoint slug.
