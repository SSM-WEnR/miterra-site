# Miterra Documentation Website

## Build using GitHub Actions

### Setting up the GutHub App

1. From the GitHub organization page, go to **Settings**, scroll down to the **Developer settings** > **GitHub Apps** section in the left panel.

2. Click on **New GitHub App**.
   * Give a name to the GitHub App, for example, "Miterra Site Build Bot".
   * Set **Homepage URL** to that of the `miterra-site` repo. 
   * Deactivate **Webhook**.
   * Under **Permissions**, grant the following access persmissions to **Repository permissions**:

     | Item     | Access    |
     |----------|-----------|
     | Actions  | Read-only |
     | Contents | Read-only |
     | Metadata | Read-only |

   * Under **Where can this GitHub App be installed?**, select **Only on this account**.
   * Keep all other settings as default.
   * Finally, click **Create GitHub App**.

3. In the About page for the GitHub App, 
   * Take a note of the **App ID**.
   * Scrool down to the bottom of the page, click **Generate a private key**, and save the _.pem_ file to a secure location.
  
> [!IMPORTANT]
> Keep the _.pem_ file safe and never share it with anyone.

4. Click **Install App** in the left panel:
   * Install the app for the organization in which the `miterra-docs` and `miterra-site` repos are hosted.
   * When prompted which repositories it should be installed to, select **Only select repositories**, and select the `miterra-docs` and `miterra-site` repos.

### Configuring Repository Secrets
Make sure you have admin access to the `miterra-docs` and `miterra-site` repos.

On both repos, go to **Settings** > **Secrets and variables** > **Actions**, under **Repository secrets**, create two new secrets:

| Name                | Secret                                                            |
|---------------------|-------------------------------------------------------------------|
| BOT_APP_ID          | GitHub App ID copied from Step 3 above.                           |
| BOT_APP_PRIVATE_KEY | The full content of the `.pem` file downloaded from Step 3 above. |

