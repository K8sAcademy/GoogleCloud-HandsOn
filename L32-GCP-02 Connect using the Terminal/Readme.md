# L32-GCP-02

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

Deploy an app to GKE

## Create the cluster

Create the cluster using the default VM size with a node count of 2

    gcloud container clusters create hello-cluster --num-nodes=2 --zone us-central1-c

## kubectl context

The create command will automatically switch context for you. If you want to connect to an existing cluster, get the cluster credentials using:

    gcloud container clusters get-credentials hello-cluster

## Let's check if we have a new context

    kubectl config get-contexts

## Are you connected to the cluster?

    kubectl get nodes

## Voting app

The source code is available here: https://github.com/dockersamples/example-voting-app

## Deploy the app

    kubectl create namespace vote
    kubectl create -f vote/

## Get the pods info

    kubectl get pods -n vote

## Get the services info

    kubectl get svc -n vote    

## Monitor the load balancers configuration progress

    kubectl get svc -n vote --watch

Get the external IP for the **vote** service and test in a browser.

Get the external IP for the **result** service and test in a browser to see the results.

## View in Console

Open the Console and click on the Workloads menu to see the pods.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L32-GCP-02-01.png)

Click on the Workloads menu to see the services.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L32-GCP-02-02.png)

## Delete the app

    kubectl delete -f vote/
    kubectl delete ns vote

    Don't delete the cluster, we will use it in the next lab.

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online