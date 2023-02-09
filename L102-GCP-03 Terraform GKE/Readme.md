# L102-GCP-03

## Create a new GKE

We'll use the google_container_cluster resource from the Google prodider. The documentation is available here:
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster

## Initialize

    terraform init

## Edit main.tf

locate the provider block.

    provider "google" {
    credentials = file("key.json") # the JSON key filename

    project = "" # the project name
    region  = "us-central1"
    zone    = "us-central1-c"
    }

Set the JSON key filename

    credentials = file("key.json")

Set the project name

    project = ""

Save the file.

## Let's test the plan

    terraform validate
    terraform plan

## Let's create the cluster

    terraform apply

Head to the Console and validate the cluster creation.

    gcloud container clusters list

## Cleanup

    terraform destroy

Validate

    gcloud container clusters list
