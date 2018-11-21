description: Learn more about creating and using experience domains and slugs in the Losant platform.

# Experience Domains And Experience Slugs

Experience domains and experience slugs are the two ways that you (or your users) can access an experience that you have created. An experience domain is a custom domain at which a [version](/experiences/versions/) of your experience is available on the Internet. Your application can have multiple experience domains, and each domain can point to a different version of your experience. Or, multiple domains can point to the same experience version.

Experience slugs are a less customizable way of exposing your experience; you can configure one or more subdomains of `onlosant.com` to point at your experience versions.

Every application experience is guaranteed to have a single slug, which is `<YOUR_APPLICATION_ID>.onlosant.com`. By default this is pointed at the "develop" version of your experience. You cannot delete this slug, although you can change what version it points at.

Experience domains are only available within applications owned by an [organization](/organizations/overview/). If you require a fully custom domain in front of your experience endpoints for one of your [Sandbox](/user-accounts/sandbox/) applications, you will need to migrate that application to an organization.

## Viewing Experience Domains and Slugs

![Domains Overview](/images/experiences/domains-overview.png "Domains Overview")

Domains and Slugs are listed under the "Domains" menu item of your application's "Experience" menu. Click a domain name or a slug in the respective lists to view their configuration or make edits.

## Working with Experience Domains

![Add Experience Domain](/images/experiences/domains-add.png "Add Experience Domain")

From the Domains list page, click "Add" in the at the top right of the domain list. This will take you to a page where the new domain can be configured.

### Domain Configuration

Setting up an Experience Domain takes only one required field: the **Domain** itself. The domain must meet the following criteria:

- It must be comprised of **[valid characters](https://en.wikipedia.org/wiki/Domain_name#Domain_name_syntax)** for a domain.
- It must be **unique** across the entire Losant platform.
- It must originate from a **[known top-level domain](https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains)**.
- It **may** contain a **subdomain** in the form of a [wildcard](https://en.wikipedia.org/wiki/Wildcard_DNS_record) or a static name.

If you do not already have a domain, you can purchase one through a registrar such as [NameCheap](https://www.namecheap.com/domains/domain-name-search.aspx) or [GoDaddy](https://www.godaddy.com/domains/domain-name-search).

You will almost certainly want to fill out the next field as well, the `Version` field. This configures which version of your experience this domain will load and use. By default, it is the `develop` version, but you can change it to any version of your experience that exists (or even choose no version at all).

![Domain Configuration](/images/experiences/domains-configuration.png "Domain Configuration")

### Securing Your Domain

When configuring the domain, you may also include an **SSL Key** and **SSL Certificate** to secure requests to your experience endpoints. If the certificate was acquired through a non-standard issuer, you may optionally include an **SSL Bundle** containing the root and intermediate certificates.

Securing the domain is optional, though we strongly recommend it. SSL certificates can be purchased at providers such as [NameCheap](https://www.namecheap.com/security/ssl-certificates.aspx); you can also get a free SSL from [Let's Encrypt](https://letsencrypt.org/getting-started/).

After acquiring an SSL certificate, return to your experience domain and insert the Key and Certificate values, and optionally the Bundle.

### Configuring DNS Records

After you have set up the domain within Losant (and assuming you have the domain registered already), you will have to make a change to your domain's DNS records to forward all requests hitting the domain to your application experience.

1. Log in to your registrar account and navigate to the DNS settings for the domain in question. (These steps will vary depending on your registrar.)
2. Add a [CNAME DNS record](https://en.wikipedia.org/wiki/CNAME_record) ("Host") for the domain exactly as configured within Losant (e.g. potentially with a static / wildcard subdomain or none at all).
3. Set the value ("Points to") of the record to your application ID experience slug **without the protocol**. For example, if your application ID is `123412341234123412341234`, enter `123412341234123412341234.onlosant.com` as the value.

![GoDaddy CNAME Example](/images/experiences/domains-godaddy-dns-example.png "GoDaddy CNAME Example")

The picture above is an example for configuring the CNAME record on a domain registered at GoDaddy; all registrars will have a similar interface for entering the necessary record.

It may take some time for the changes to [propagate](https://www.namecheap.com/support/knowledgebase/article.aspx/9622/10/dns-propagation--explained) after you save your work; propagation usually takes a couple hours but can take as long as 24 hours. At that point you can start issuing requests to your experience endpoints using the new domain.

## Working with Experience Slugs

![Add Experience Slug](/images/experiences/slugs-add.png "Add Experience Slug")

From the Domains list page, click "Add" in the at the top right of the slugs list. This will take you to a page where the new slug can be configured.

### Slug Configuration

Setting up an Experience Slug has two fields - the slug name and the experience version this slug should point at.

![Edit Endpoint Slug](/images/experiences/domains-edit-endpoint-slug.png "Edit Endpoint Slug")

The slug name is required and must meet the following criteria:

- It must be comprised of **[valid characters](https://en.wikipedia.org/wiki/Domain_name#Domain_name_syntax)** for a domain.
- It must be **unique** across the entire Losant platform.
- It must be at least four characters long.

The version field configures which version of your experience this slug will load and use. By default, it is the `develop` version, but you can change it to any version of your experience that exists (or even choose no version at all).

## Deleting Domains and Slugs

A domain or slug can be deleted by clicking the "Delete" icon next to any domain or slug on the list page, or by clicking the "Delete" button in the footer of a domain's or slug's edit page. Deletion will take effect immediately, and any requests to the domain or slug will neither return a result nor forward to your experience's other domains or endpoint slug.

**Note:** You cannot delete the Application ID experience slug.
