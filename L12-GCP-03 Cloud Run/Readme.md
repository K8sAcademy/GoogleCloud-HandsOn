# L12-GCP-02

Deploy containers images to Cloud Run.

## New project

Open the Console, create a new project and enable billing.

## Configure the project

List the projects.

    gcloud projects list

Set the new project as the current project.

    gcloud config set project [projectName]

Enable the Cloud Run API

    gcloud services enable run.googleapis.com

Set a region

    gcloud config set run/region us-central1

## Deploy an image

Deploy the Hello image.

    gcloud run deploy hello --image us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 --allow-unauthenticated

List the services

    gcloud run services list

Get the configuration

    gcloud run services describe hello

You can also filter values like this

    gcloud run services describe hello --format="value(status.address.url)"

## Console

Head to the console and locate the Cloud Run instance.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L12-GCP-03-01.png)

Click on the Revisions tab. Select the revision and look at the configuration on the right of the screen.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L12-GCP-03-02.png)

## Update the config

Let's change the Concurrency value from the default 80 to 100.

Click on the **YAML** tab and then on the **Edit** button. Locate the **containerConcurrency** property and set it to 100.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L12-GCP-03-03.png)

You get a warning that you need to rename the revision. Remember, a revision (image + config) is immutable. Change the name and a **Save and Deploy New Revision** button will appear.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L12-GCP-03-04.png)

Click on the **Revisions** tab. Locate the new revision and validate that the Concurrency value is set to 100.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L12-GCP-03-05.png)

## Deploy Hello v2

    gcloud run deploy hello --image us-docker.pkg.dev/google-samples/containers/gke/hello-app:2.0 --allow-unauthenticated

Head to the console and validate that v2 is running.

## Cleanup

Delete the hello service

    gcloud run services delete hello

Validate

    gcloud run services list 

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online
