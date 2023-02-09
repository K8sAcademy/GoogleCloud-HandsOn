# L104-GCP-02

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Key file

Copy the service account key file.

## Create a new GKE

Open a terminal and navigate to the **create** folder

    cd create

## Edit main.tf

locate the provider block.

    provider "google" {
    credentials = file("../key.json") # the JSON key filename

    project = "" # the project name
    region  = "us-central1"
    zone    = "us-central1-c"
    }

Set the JSON key filename

    credentials = file("../key.json")

Set the project name

    project = ""

Save the file.

## Initialize the create folder

    terraform init

## Let's create the cluster

    terraform apply

Wait for the cluster to be created.

## Use a Data Source

In the terminal, navigate to the **query** folder.

    cd ../query

## Edit the **main.tf** file.

Use the same settings you just used.

## Initialize the query folder

    terraform init

## Query the data source

    terraform apply

## Cleanup

Navigate to the **create** folder.

    cd ../create
    terraform destroy
