# Losant Documentation

Repository backing the main [Losant](https://www.losant.com) documentation,
which is live at <https://docs.losant.com>.  Pull requests and other updates
are always welcome!

## Editing The Documentation

This documentation uses [mkdocs](http://www.mkdocs.org) to build
the actual documentation website.  This repo can be cloned and run locally
using mkdocs for making changes and previewing them.

To build the Losant documentation yourself, do the following:

*   **Prerequisites**  
Install Mkdocs. [See Instructions](http://www.mkdocs.org/#installation).

*   **Run the built in mkdocs webserver**  
Go to the repo directory, and run `mkdocs serve`. The documentation site
will be running at <http://localhost:8000>.  Any changes made to the documentation
markdown will be reflected automatically.

## Deploying

```bash
npm install
AWS_SECRET_KEY=your_secret AWS_ACCESS_KEY=your_key npm run deploy
```

*****

Copyright (c) 2017 Losant IoT, Inc

<https://www.losant.com>
