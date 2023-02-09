# L102-GCP-02

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Create a bucket

To use a backend in GCP, let's first create a bucket in Cloud Storage.

Locate the **Cloud Storage** service and click the **Create Bucket** link.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-01.png)

Give the bucket a **unique name** and click **Continue**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-02.png)

For the location, select Region and select **us-central1**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-03.png)

Select **Standard** for the storage class.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-04.png)

Prevent public access.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-05.png)

Enable **Object Versioning** and click on the **Create** button.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-06.png)

## Edit the main.tf file

Edit the **main.tf** file and locate the backend block.

    backend "gcs" {
        bucket  = ""  # your bucket name
        prefix  = "tfstate"
        credentials = "key.json" # the JSON key filename
    }

Set **bucket** to your bucket name.

Set **credentials** to the name of the JSON key filename.

Locate the **provider** block.

    provider "google" {
    credentials = file("key.json") # the JSON key filename

    project = "" # the project name
    region  = "us-central1"
    zone    = "us-central1-c"
    }

Set **credentials** to the name of the JSON key filename.

Set **project** to the name of the GCP project.

Save the file.

## Let's init the backend

    terraform init

## Validate & Deploy

Validate you code

    terraform validate

Deploy

    terraform apply

Head to the Console and validate that a Compute Engine VM was created.

## State file

Locate the bucket. You should see the state file.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L102-GCP-02-07.png)

## Cleanup

Delete the VM.

    terraform destroy

You can also delete the **bucket** by selecting it, clicking on the **Delete** button.