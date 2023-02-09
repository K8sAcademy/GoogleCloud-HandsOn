
# L11-GCP-02

Deploy an express app to App Engine.

## Create a new project

    gcloud projects create --name=[projectName]

List the projects.

    gcloud projects list

Set the new project as the current project.

    gcloud config set project [projectName]

## Enable billing

Locate and select the project.

Open the left menu and select **Billing**.

The project should tell you that it's not linked to a billing account. Click the link and select the billing account.

## Enable the App Engine API

    gcloud services enable appengine

## Create a new App Engine **app.yaml** file

Edit the file and paste these lines but remove the indentation.

    runtime: custom
    env: flex

## Deploy the app

The command will use the app.yaml and Dockerfile files. Deploy the source code and invoke Cloud Build.  

    gcloud app deploy

Test the Website

    gcloud app browse

## Console

Open the Console and view the App Engine service.

View the Cloud Build service. Try to locate the where the source code was stored (hint: Storage).

## Code change

In code, locate the index.js file in the routes folder. Change the title value from Express to **Express2**. Save the file.

## Deploy the new version

   gcloud app deploy --version v2

In the Console, click on the App Engine Versions menu. You should see both versions listed.

## Clean up

Deleting the project will also delete the App Engine app, Cloud Build and Cloud Storage.

    gcloud projects list
    gcloud projects delete [projectName]

Validate

    gcloud projects list
