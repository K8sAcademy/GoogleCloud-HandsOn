# L39-GCP-02

## Logging & Monitoring

## Create the deployment

Let's deploy 3 instances of the Nginx image, and 1 kuard instance with a load balancer.

    kubectl apply -f deploy.yaml

## Set the autoscaling limits

    kubectl autoscale deployment kuard --cpu-percent=50 --min=1 --max=10

## Launch a browser

Get the load balancer public IP address

    kubectl get svc

In a browser, launch the Kuard Web app. Generate some activity by clicking on **Keygen Workload**, check the **Enabled** checkbox and click on **Submit**.

## Cloud Logging

Locate the **Cloud Logging** service. In the left menu, select **Logs Explorer**.

Let's filter on **Kubernetes Container** and the **Default** namespace so we can see the logs of the containers we deployed.

## Cloud Monitoring

Locate the **Cloud Monitoring** service. In the left menu, select **Dashboards** and then the **GKE** dashboard.

Scroll down until you see the **Pods** section.  Locate the instance of the kuard container that exceeds the CPU limits.

Select it and look at the **Metrics** and **Logs** tabs.

## Cleanup

    kubectl delete hpa kuard
    kubectl delete -f deploy.yaml

