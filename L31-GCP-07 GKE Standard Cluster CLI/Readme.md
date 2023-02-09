# L31-GCP-07

## Create a GKE Standard cluster using the CLI

Get your project's ID

    gcloud projects list

Open a terminal and create a new cluster using

    gcloud container clusters create cluster-1 --num-nodes 1 --zone us-central1-c --project [projectID]

## Get more info

List your clusters

    gcloud container clusters list

Get more info

    gcloud container clusters describe cluster-1

## Cleanup

    gcloud container clusters delete cluster-1
