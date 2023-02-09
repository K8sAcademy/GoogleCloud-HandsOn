# L39-GCP-02

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

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

![image](https://kubernetesacademy.online/wp-content/uploads/2021/06/L40-AZ-04-18.png)

## Cloud Logging

Locate the **Cloud Logging** service. In the left menu, select **Logs Explorer**.

Let's filter on **Kubernetes Container** and the **Default** namespace so we can see the logs of the containers we deployed.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L39-GCP-02-01.png)

## Cloud Monitoring

Locate the **Cloud Monitoring** service. In the left menu, select **Dashboards** and then the **GKE** dashboard.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L39-GCP-02-02.png)

Scroll down until you see the **Pods** section.  Locate the instance of the kuard container that exceeds the CPU limits.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L39-GCP-02-03.png)

Select it and look at the **Metrics** and **Logs** tabs.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L39-GCP-02-04.png)

## Cleanup

    kubectl delete hpa kuard
    kubectl delete -f deploy.yaml

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online