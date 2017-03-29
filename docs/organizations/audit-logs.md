# Audit Logs

Enterprise organizations have access to audit logs, detailing the creation, modification and deletion of Losant resources by your organization's team members. This allows administrators to view a trail of edits made to any resource owned by that organization.

If audit logs are enabled for your organization, and you have [administrator permissions](/organizations/members/#member-roles) for the organization, you will find a link to the logs in the left column of the "Settings" tab:

![Audit Logs Link](/images/organizations/audit-logs-overview.png "Audit Logs Link")

## Log Entries

Currently, log entries are sorted by timestamp (latest to earliest). Audit logs are available for all organization edits from the second week of January 2017 onwards, and the records are kept for one year regardless of your organization's data retention plan.

![Audit Logs List](/images/organizations/audit-logs-list.png "Audit Logs List")

### Available Information

The following information is available for each request included in the audit log:

*   Request ID
*   Timestamp of request
*   URL path and HTTP method, which maps to a Losant API method
*   Query parameters included in the request, if applicable
*   Request body, if applicable
*   Request initiator (usually an organization member, but occasionally a workflow or other entity)
*   Response body, if applicable
*   HTTP response code

![Audit Log Detail](/images/organizations/audit-log-detail.png "Audit Log Detail")

Note that a number of sensitive details, such as application key secrets, credit card numbers and invitation tokens, are redacted from the audit logs for security purposes.

## What's Recorded

As a general rule, any request that creates, edits or deletes a Losant resource will appear in the audit logs. More specifically ...

*   Edits to the [organization itself](/organizations/overview/#managing-organizations), such as name, description or [billing plan](/organizations/overview/#choosing-a-plan) changes
*   Changes to [organization members](/organizations/members/), such as leaving the organization or changing a member's role
*   Creation, revocation, acceptance or deletion of any [member invitation](/organizations/members/#inviting-new-members)
*   [Transfer of resources](/organizations/overview/#transferring-resources) to or from the organization, whether the other party is another organization or a [user's Sandbox](/user-accounts/sandbox/)
*   Creation or deletion of any [application](/applications/overview/) or [dashboard](/dashboards/overview/) owned by the organization, or edits to those resources. This includes application sub-resources, such as:
    * [Access Keys](/applications/access-keys/)
    * [Application API Tokens](/applications/application-tokens/)
    * [Devices](/devices/overview/)
    * [Device Recipes](/devices/device-recipes/)
    * [Experience Endpoints](/experiences/endpoints/)
    * [Experience Groups](/experiences/groups/)
    * [Experience Users](/experiences/users/)
    * [Webhooks](/applications/webhooks/)
    * [Workflows](/workflows/overview/)

## What's Not Recorded

Not everything that happens within your organization is available in the audit log. Here are a number of requests that do not show up in the logs:

*   User or device [authentications](/rest-api/auth/)
*   Edits to any personal [user account](/user-accounts/overview/), including password resets
*   [Device commands](/devices/commands/) or [state reports](/devices/state/), whether by [REST](/rest-api/overview/) or [MQTT](/mqtt/overview/)
*   Creation or deletion of [Losant events](/applications/events/), or the editing of any event
*   State retrieval queries, including those made by Losant dashboards
*   GET requests (data retrieval) on any organization-owned resource or sub-resource
*   Many "pre-process" errors, such as malformed requests, 404s and timeouts
