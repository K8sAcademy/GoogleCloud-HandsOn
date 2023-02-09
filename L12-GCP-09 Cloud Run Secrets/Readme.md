# L12-GCP-09

Cloud Run Secrets

## Secret Manager

In the Console, locate the **Secret Manager** service. Enable the API.

Create a secret called Hello and set it's value. Click on the **Create Secret** button.

## Cloud Run

Using the Console, create a new Cloud Run service. Use the Kuard image.

    northamerica-northeast1-docker.pkg.dev/k8s-academy-online-347213/k8sacademy/kuard:latest

## Reference a secret

In the lower section, select the **Variables & Secrets** tab. Click on **Reference a Secret**.

Name the secret, set it as an **environment variable** and name the variable. Click on the **Grant** button.

Create the Cloud Run service.

## View the variable

Open the Kuard app in a browser and click on the **Server Env** link. The environment variable will be displayed.

## View the secret new permission

Go back to the Secret Manager and locate the Hello secret. Select the service and look at the permissions.  The Cloud Run service account has been added with the Accessor role.

## Cleanup

Delete the kuard service using the Console or the CLI

    gcloud run services delete kuard
    gcloud run services list 

    gcloud secrets delete Hello
    gcloud secrets list

