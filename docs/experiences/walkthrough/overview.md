# Experience Walkthrough

This guide provides a complete walkthrough for building an end-to-end mobile experience for an example connected product. A Losant [application experience](/experiences/overview/) provides everything required to build a product on top of our platform, including user management and custom API endpoints.

The example product in this guide is a hypothetical consumer product called lōm (pronounced like "lome"). lōm is a smart pot for house plants that will automatically notify users if the plant requires water.

![lom banner](/images/experiences/walkthrough/lom-banner.jpg "lom banner")

This guide is split into four main sections:

**Part 1: [User Registration](/experiences/walkthrough/part1/)**  
This section covers how new users will sign up for lōm once they've got the product. A Losant application experience includes user management, so all user information is stored in Losant without the need for an external service.

**Part 2: [User Login](/experiences/walkthrough/part2/)**  
Once users are registered, they'll need to log in to perform authenticated requests against the lōm API. This section demonstrates how to perform user authentication against your application experience API.

**Part 3: [Device Registration](/experiences/walkthrough/part3/)**  
After a user is registered and logged in, they will register the lōm smart pot device they've received. This section shows an example of how to do on-demand device registration and how to associate the device with the lōm user.

**Part 4: [Viewing Device Data](/experiences/walkthrough/part4/)**  
Inside the lōm app, the user can see real-time and historical moisture data about their smart pot. This section covers how to securely get data for a lōm user's devices.
