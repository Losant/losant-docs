# Salesforce Cases

The Salesforce Cases node allows Losant workflows to access the [Salesforce Service Cloud](https://www.salesforce.com/products/service-cloud/overview/) and create, read, update or delete cases in their CRM platform.

![Salesforce Cases Node](/images/workflows/data/salesforce-overview.png "Salesforce Cases Node")

## Configuration

There are three main configuration sections for the Salesforce Cases node ...

### Authentication

Most people choose to store these three values in their [workflow globals](/workflows/overview/#workflow-globals).

![Salesforce Credentials](/images/workflows/data/salesforce-credentials.png "Salesforce Credentials")

*   **Salesforce Username**: Required. This is your username for authenticating against the Salesforce API.
*   **Salesforce Password**: Required. This is your password for authenticating against the Salesforce API.
*   **Security Token**: This may be required depending on your Salesforce account settings. <a href="https://developer.salesforce.com/forums?id=906F00000009B2zIAE" target="_blank">Read more about security tokens</a>.

### Case Action Configuration

Before filling out the rest of this section, users must first choose a **Salesforce Case Action**. Depending on the selected value, a number of other fields are presented. Each field accepts a static value or a [template field](/workflows/overview/#template-fields-and-payload-paths).

![Salesforce Query](/images/workflows/data/salesforce-query.png "Salesforce Query")

#### Find

Search existing records against the parameters provided and return the result. Records must match ALL provided parameters to be returned. Leave a parameter blank to exclude it from the query.

*   **Record ID**: An ID for a single record. If included, the request will return a maximum of one record.
*   **Status**: Default options are "New", "Working", "Escalated" or "Closed"
*   **Case Origin**: Default options are "Phone", "Email" or "Web"

#### Count

Return the number of records that match these parameters. Records must match ALL provided parameters to be returned. Leave a parameter blank to exclude it from the query.

*   **Status**: Default options are "New", "Working", "Escalated" or "Closed"
*   **Case Origin**: Default options are "Phone", "Email" or "Web"

#### Create

Create a new case record. All provided fields will be added to the record. Leave a field blank to exclude it from the record for now; any parameter can always be added or updated later.

*   **Status**: Required. The status of the case, such as "New," "Closed," or "Escalated".
*   **Case Origin**: Required. The source of the case, such as "Email", "Phone", or "Web".
*   **Subject**: The subject of the case. Limit: 255 characters.
*   **Description**: A text description of the case. Limit 32KB.
*   **Contact ID**: ID of the associated Contact.
*   **Account ID**: ID of the account associated with this case.
*   **Type**: The type of case, such as "Feature Request" or "Question".
*   **Case Reason**: The reason why the case was created, such as "Instructions not clear", or "User didn’t attend training".
*   **Web Name**: The name that was entered when the case was created.
*   **Web Email**: The email address that was entered when the case was created.
*   **Web Phone**: The phone number that was entered when the case was created.
*   **Web Company**: The company name that was entered when the case was created.
*   **Priority**: The importance or urgency of the case, such as "High", "Medium", or "Low".

#### Destroy

Remove a case record.

*   **Record ID**: Required. The ID of the record to destroy.

#### Update

Update a case record. Leave a parameter blank to leave its current value unchanged.

*   **Record ID**: Required. The ID of the record to update.
*   **Status**: The status of the case, such as "New," "Closed," or "Escalated".
*   **Case Origin**: The source of the case, such as "Email", "Phone", or "Web".
*   **Subject**: The subject of the case. Limit: 255 characters.
*   **Description**: A text description of the case. Limit 32KB.
*   **Contact ID**: ID of the associated Contact.
*   **Account ID**: ID of the account associated with this case.
*   **Type**: The type of case, such as "Feature Request" or "Question".
*   **Case Reason**: The reason why the case was created, such as "Instructions not clear", or "User didn’t attend training".
*   **Web Name**: The name that was entered when the case was created.
*   **Web Email**: The email address that was entered when the case was created.
*   **Web Phone**: The phone number that was entered when the case was created.
*   **Web Company**: The company name that was entered when the case was created.
*   **Priority**: The importance or urgency of the case, such as "High", "Medium", or "Low".

### Storing The Response

![Salesforce Result](/images/workflows/data/salesforce-result.png "Salesforce Result")

 If a path is defined, the Salesforce Case node will store the response from the request at the defined [payload path](/workflows/overview/#payload-paths).
