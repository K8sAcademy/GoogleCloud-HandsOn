# L31-GCP-04

## Create a GKE Autopilot cluster using the CLI

Get your project's ID

    gcloud projects list

Open a terminal and create a new cluster using

    gcloud container --project [projectID] clusters create-auto autopilot-cluster-1 --region us-central1

## Get more info

List your clusters

    gcloud container clusters list

Get more info

    gcloud container clusters describe autopilot-cluster-1

## Cleanup

    gcloud container clusters delete autopilot-cluster-1

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online

