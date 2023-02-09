# L12-GCP-05

Cloud Run Traffic Management

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

## Deploy Hello v1

Deploy the Hello v1 image.

    gcloud run deploy hello --image us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 --allow-unauthenticated --tag=blue

## Deploy Hello v2

    gcloud run deploy hello --image us-docker.pkg.dev/google-samples/containers/gke/hello-app:2.0 --allow-unauthenticated --tag=green

Head to the console and validate that v2 is running. Running the app in the browser will display Version: 2.0.0 since v2 is the latest revision.

## Get the revisions URLs

Describing the service will list the URLs for the service and for both revisions. Open the URLs in a browser.

    gcloud run services describe hello

The Console will display the 100% of the traffic will be sent to the v2 revision.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L12-GCP-05-01.png)

## Split traffic between revision 1 and 2

Update the traffic sending 50% to the v1 revision.

    gcloud run services update-traffic hello --to-tags blue=50

Describe to see the updated configuration

    gcloud run services describe hello

Test with BASH. Replace the placeholder with the service URL (not the v1 or v2 revisions).

    for i in {1..10}; do curl [SERVICE_URL] -w "\n"; done

Test with PowerShell. Replace the placeholder with the service URL (not the v1 or v2 revisions).

    for($i=1; $i -le 10; $i++){ curl [SERVICE_URL] -w "\n" }

You should see results from the v1 and v2 revisions.

## Reset the service traffic profile to use the latest deployment

    gcloud run services update-traffic hello --to-latest

Describe to see the updated configuration

    gcloud run services describe hello

## Cleanup

Delete the hello service

    gcloud run services delete hello

Validate

    gcloud run services list 

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online
