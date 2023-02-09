# L32-GCP-03

Connect to a cluster using Cloud Shell

## Reuse the cluster from the previous lab or create a new cluster cluster

Create the cluster using the default VM size with a node count of 2

    gcloud container clusters create hello-cluster --num-nodes=2 --zone us-central1-c

## Console

In the Console, locate you cluster,click on the **Connect** button and click on the **Run in Cloud Shell** link.

When Cloud Shell opens, hit the Enter key to run the command that was pasted in.

Validate by getting the nodes

    kubectl get no

## Voting app

The source code is available here: https://github.com/dockersamples/example-voting-app

In Cloud Shell, clone the repo

    git clone https://github.com/dockersamples/example-voting-app.git

## Deploy the app

    kubectl create ns vote
    kubectl create -f example-voting-app/k8s-specifications/

## Get the pods info

    kubectl get pods -n vote

## Get the services info

    kubectl get svc -n vote    

## Monitor the load balancers configuration progress

    kubectl get svc -n vote --watch

Get the external IP for the **vote** service and test in a browser.

Get the external IP for the **result** service and test in a browser to see the results.

## Launch the editor

Click on the **Open Editor** button and take a look at the YAML files we used.

## Cleanup

    Delete the cluster.
