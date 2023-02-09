# L10-GCP-05

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

Push/Pull an image to Artifact Registry

## New project

Open the Console, create a new project and enable billing.

## Configure the project with the CLI

Make sure you're logged in the correct account.

    gcloud auth list
    gcloud config list

List the projects.

    gcloud projects list

Set the new project as the current project.

    gcloud config set project [projectID]

Get the regions list

    gcloud compute regions list

Set a region

    gcloud config set run/region us-central1

## Console

In the Console locate the Artifact Registry service.

Click on the **Create Repository** link.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L10-GCP-05-01.png)

Set the format to **Docker**, the location type to **Region** and the encryption to **Google Managed**. Click on **Create**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L10-GCP-05-02.png)

Select the newly created repo.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L10-GCP-05-03.png)

Click on the **Add Principal** button located to the right of the screen. Tyle **allUsers** and select the **Artifact Registry Reader**. This will allow anyone to access the repository.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L10-GCP-05-04.png)

## Build the image

Open a terminal and build the image.

To get the regions list

    gcloud compute regions list

To get your projects list

    gcloud projects list

Replace the placeholders and build the image

    docker build -t [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1 .

## Push the image

Try pushing the image.

    docker push [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1

This will fail if you haven't logged in first.  Log in and try again.

Open a terminal and run this command. Replace the placeholder region with the repository's region.

    gcloud auth configure-docker [region]-docker.pkg.dev

Try pushing again.

## List the images

    gcloud artifacts repositories list --project=[my-project] --location=[region]

## Console

Back in the Console, locate the image you just pushed.

## Pull the image from the repository

Remove the local image first

    docker rmi [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1

Then pull it

    docker pull [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1

## Run

    docker run -d -p 3000:3000 --name myapp-1 [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1

## Test in a browser

Test that the app is running by heading to http://localhost:3000

---

## Create version 2

Let’s first make a change to the code, build a new image and tag it as version 2 and push it to Artifact Registry.

## Code change

In code, locate the index.js file in the routes folder. Change the title value from Express to **Express2**. Save the file.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/01/L10-DO-05-02.png)

## Build the image

    docker build -t [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v2 .

## Push the image

    docker push [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v2

## List the repos in your repository

    gcloud artifacts repositories list --project=[my-project] --location=[region]

## Pull the image

Remove the local image first

    docker rmi [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v2

Then pull it

    docker pull [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v2

## Run

Run the V2 image using port 3001 on localhost.

    docker run -d -p 3001:3000 --name myapp-2 [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v2

## Test in a browser

Test that the app is running by heading to http://localhost:3001

## Delete a repository using the CLI

    gcloud artifacts docker images delete [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1

In the Console, confirm that the v1 tag was removed.

In the Console, delete the repository but keep the project and the Artifact Registry.

## Cleanup

    docker stop myapp-1
    docker rm myapp-1
    docker stop myapp-2
    docker rm myapp-2
    docker rmi [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v1
    docker rmi [region]-docker.pkg.dev/[my-project]/[my-registry]/expressapp:v2