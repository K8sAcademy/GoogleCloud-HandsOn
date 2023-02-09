# L31-GCP-06

## Create a GKE Standard cluster

In the Console, locate the **Kubernetes Engine** service. Enable the API.

Click on the **Configure** button to create a Standard cluster.

You can change the cluster name and the data center location but leave the other settings as is.

# Node pool

Click on the default-pool link in the left menu. You can change the number of nodes here.

Click the **Create** button. This will take a few minutes to complete.

## Config

Select the cluster and look at the settings.

Try to click on the **Release Channel** edit button (pen).

Try to click on the **Maintenance window** edit button (pen).

## Deploy an Nginx image

Let's deploy an Nginx image.  Click the **Deploy** button or the **Workloads** link in the left menu.

Leave the default settings as is. Click **Continue**.

Leave the Deployment configuration values as is. Click **Deploy**.

## Add a service

Click the **Expose** link or button.

This will create a load balancer to expose the Nginx container over the Internet. Click **Expose**.

Locate the external IP address and open it in a browser.

## Cleanup

Select the cluster and click on the Delete button. Confirm by typing the cluster name. The load balancer service will be deleted automatically.


