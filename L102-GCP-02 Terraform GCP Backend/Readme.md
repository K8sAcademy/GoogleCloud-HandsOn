# L102-GCP-02

## Create a bucket

To use a backend in GCP, let's first create a bucket in Cloud Storage.

Locate the **Cloud Storage** service and click the **Create Bucket** link.

Give the bucket a **unique name** and click **Continue**.

For the location, select Region and select **us-central1**.

Select **Standard** for the storage class.

Prevent public access.

Enable **Object Versioning** and click on the **Create** button.

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

## Cleanup

Delete the VM.

    terraform destroy

You can also delete the **bucket** by selecting it, clicking on the **Delete** button.