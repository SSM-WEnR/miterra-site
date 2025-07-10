# Miterra Documentation Website

## Build using GitHub Actions
To build this site manually, go to the **Actions** tab, on the left panel select **Build & Publish Site**, then click **Run workflow**. In the popup window, type `miterra-site` in **Source repo**, and provide a explanatory message for the build in **Source message**.

This site is also automatically rebuilt when a dispatch is sent from one of the following repositories:
- `miterra-docs`
- `miterra-dev-docs`
- `miterra-site-ui`


## GitHub Workflow Setup
The following steps are only necessary if you want to clone this repository and set up an automated workflow of your own.

### Setting up the GutHub App
1. On the GitHub organization page, go to **Settings**, scroll down to the **Developer settings** > **GitHub Apps** section in the left panel.

2. Click on **New GitHub App**.
   * Give a name to the GitHub App, for example, "Miterra Site Build Bot".
   * Set **Homepage URL** to that of the `miterra-site` repository. 
   * Deactivate **Webhook**.
   * Under **Permissions**, grant the following access persmissions to **Repository permissions**:

     | Item     | Access         |
     |----------|----------------|
     | Actions  | Read and write |
     | Contents | Read and write |
     | Metadata | Read-only      |
     | Pages    | Read and write |

   * Under **Where can this GitHub App be installed?**, select **Only on this account**.
   * Keep all other settings as default.
   * Finally, click **Create GitHub App**.

3. In the About page for the GitHub App, 
   * Take a note of the **App ID**.
   * Scrool down to the bottom of the page, click **Generate a private key**, and save the _.pem_ file to a secure location.
  
> [!IMPORTANT]
> Keep the _.pem_ file safe and never share it with anyone.

4. Click **Install App** in the left panel:
   * Install the app for the organization in which the `miterra-site` repository is hosted.
   * When prompted which repositories it should be installed to, choose **Only select repositories**, and then select the `miterra-site` and `miterra-site-ui` repository, and additionally any other repositories that contain the documentation you would like to include in the site, e.g., `miterra-docs` and `miterra-dev-docs`.

### Configuring Repository Secrets
Make sure you have administrator access to all the selected repositories in Step 4 above.

On each of the repository, go to **Settings** > **Secrets and variables** > **Actions**, under **Repository secrets**, create two new secrets:

| Name                | Secret                                                            |
|---------------------|-------------------------------------------------------------------|
| BOT_APP_ID          | GitHub App ID copied from Step 3 above.                           |
| BOT_APP_PRIVATE_KEY | The full content of the `.pem` file downloaded from Step 3 above. |

### Activate the Workflow
The actions to build the site and publish it to GitHub Pages are configured in the workflow file [`.github/workflows/build-publish.yml`](.github/workflows/build-publish.yml). The workflow may be triggered by several events:
- A push to the `main` branch, and the head commit message starts with the case-sensitive string `[Release]`.
- Invoked by a dispatch from another repository. For example, when the `miterra-docs` repository is updated, it sends a request to activate the workflow to rebuild the site.
- Invoked manually under the **Actions** tab.

Once activated, the workflow will perform the following steps in order:
1. Check out the `main` branch.
2. Install required packages, such as Node.js, Antora, and extensions.
3. Generate proper authentication token to access private repositories.
4. Build the site using Antora.
5. Publish the site to GitHub Pages.
6. Create a new release on GitHub using calendar versioning.
