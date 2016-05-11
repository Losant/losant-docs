# losant-docs
Losant documentation can be downloaded and ran locally.  To build the losant documentation, do the following:

**Prerequisites**

1. Install Mkdocs. [See Instructions](http://www.mkdocs.org/#installation).

**To use built in mkdocs built-in webserver:**

1. Go to root directory, and run `mkdocs serve`.  Your site will be running at http://localhost:8000

**To build static documentation website:**

1. Go to root directory, and run `mkdocs build`.  Your website will be built in the `site` folder.

**To deploy documentation:**

1. AWS_SECRET_KEY=<secret> AWS_ACCESS_KEY=<key> npm run deploy
