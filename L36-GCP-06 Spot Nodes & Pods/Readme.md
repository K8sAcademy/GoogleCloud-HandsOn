# L36-GCP-06

Let's save money by creating a spot node pool

## Create the cluster

    gcloud container clusters create spot-cluster-1 --num-nodes 1 --zone us-central1-c 

## Add a node pool

    gcloud container node-pools create spot-pool --cluster spot-cluster-1 --zone us-central1-c  --spot --num-nodes 1

List the node pools

    gcloud container node-pools list --cluster=spot-cluster-1 --zone us-central1-c

## Validate the taint on a node

List the nodes and copy the name of a spot one to describe it

    kubectl get no
    kubectl describe no [node name]

## Deploy a pod on a Spot node

    kubectl apply -f myapp.yaml

Validate that the pod was scheduled on a spot node

    kubectl get po -o wide

## Cleanup

    gcloud container clusters delete spot-cluster-1 --zone us-central1-c
