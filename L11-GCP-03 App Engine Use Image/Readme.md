# L11-GCP-03

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

Deploy containers images to App Engine.

## Create a new project

    gcloud projects create --name=[projectName]

List the projects.

    gcloud projects list

Set the new project as the current project.

    gcloud config set project [projectName]

## Enable billing

Locate and select the project.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L11-GCP-02-01.png)

Open the left menu and select **Billing**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L11-GCP-02-02.png)

The project should tell you that it's not linked to a billing account. Click the link and select the billing account.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L11-GCP-02-03.png)

## Enable the App Engine API

    gcloud services enable appengine

## Deploy the Hello image

    gcloud app deploy --image-url us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0 app.hello.yaml

Browse using the service name

    gcloud app browse -s default

## Deploy the Kuard image

    gcloud app deploy --image-url northamerica-northeast1-docker.pkg.dev/k8s-academy-online-347213/k8sacademy/kuard:latest app.kuard.yaml

See if the env variable was set

    gcloud app browse -s kuard

## Console

Open the Console and view the App Engine service.

## Deploy a new version of the Hello image

    gcloud app deploy --image-url us-docker.pkg.dev/google-samples/containers/gke/hello-app:2.0 app.hello.yaml --version v2

In the Console, click on the App Engine Versions menu. You should see both versions listed.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L11-GCP-03-01.png)

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L11-GCP-03-02.png)

## Clean up

Deleting the project will also delete the App Engine app, Cloud Build and Cloud Storage.

    gcloud projects list
    gcloud projects delete [projectName]

Validate

    gcloud projects list

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online