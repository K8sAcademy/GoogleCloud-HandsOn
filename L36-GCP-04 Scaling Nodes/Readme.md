# L36-GCP-04

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Scaling Nodes

## Create a new cluster

Let's create a 1 node cluster with autoscaling enabled.

    gcloud container clusters create auto-cluster-1 --num-nodes 1 --zone us-central1-c --enable-autoscaling --min-nodes 1 --max-nodes 10 

Confirm that the autoscaler is enabled

    gcloud container clusters describe auto-cluster-1 --zone us-central1-c

List the nodes

    kubectl get nodes

## Deploy 10 pods

    kubectl apply -f deploy.yaml

    kubectl get pods

    kubectl get nodes

## Delete the pods

    kubectl delete -f deploy.yaml

## Delete the cluster

    gcloud container clusters delete auto-cluster-1 --zone us-central1-c 

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online