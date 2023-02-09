# L12-GCP-07

Cloud Run Logging

## Project

Reuse the previous project or create a new one.

List the projects.

    gcloud projects list

Set the new project as the current project.

    gcloud config set project [projectName]

Enable the Cloud Run API

    gcloud services enable run.googleapis.com

Set a region

    gcloud config set run/region us-central1

## Deploy the Kuard image

    gcloud run deploy kuard --image northamerica-northeast1-docker.pkg.dev/k8s-academy-online-347213/k8sacademy/kuard:latest --allow-unauthenticated

Open a browser and navigate.

## View logs in Cloud Run

Locate the service in the Console and select the Logs tab.  Kuard output some log info.

## View logs in Cloud Logging

Use the top searchbox to locate the **Logging** service. In the left menu, select **Logs Explorer**.
In the **Log Fields** section, select **Cloud Run Revision** and kard as the **Service Name**.

## Monitor in Cloud Run

Locate the service in the Console and select the **Metrics** tab.  You should see some metrics.

## Monitor in Cloud Monitoring

Use the top searchbox to locate the **Monitoring** service. In the left menu, select **Metrics Explorer**.

Use this metric: Clour Run Revision | Request_count | Request Count

Refrest the kuard page in the browser a few times hitting F5. You should see the request/s graph shows some values.

## Cleanup

Delete the hello service

    gcloud run services delete kuard

Validate

    gcloud run services list 


