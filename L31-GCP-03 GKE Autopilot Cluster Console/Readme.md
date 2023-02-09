# L31-GCP-03

## Create a GKE Autopilot cluster

In the Console, locate the **Kubernetes Engine** service. Enable the API.

Click on the **Configure** button to create an Autopilot cluster.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-01.png)

You can change the cluster name and the data center location but leave the other settings as is.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-02.png)

Click the **Create** button. This will take a few minutes to complete.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-03.png)

## Config

Select the cluster and look at the seetings.  Note that the **Edit** button is greyed out so you can't make modifications however, some settings can be changed.

Try to click on the **Edit** button.

Try to click on the **Release Channel** edit button (pen).

Try to click on the **Maintenance window** edit button (pen).

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-04.png)

## Deploy an Nginx image

Let's deploy an Nginx image.  Click the **Deploy** button or the **Workloads** link in the left menu.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-05.png)

Leave the default settings as is. Click **Continue**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-06.png)

Leave the Deployment configuration values as is. Click **Deploy**.

## Add a service

Click the **Expose** link or button.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-07.png)

This will create a load balancer to expose the Nginx container over the Internet. Click **Expose**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-08.png)

Locate the external IP address and open it in a browser.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-09.png)

## Nodes?

Does our Autopilot cluster has nodes? No, we are billed by vCPU and memory used by the pods.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-10.png)

## Cleanup

Select the cluster and click on the Delete button. Confirm by typing the cluster name. The load balancer service will be deleted automatically.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L31-GCP-03-11.png)

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online

