# L13-GCP-02

Compute Engine

## Create a VM instance

In the Console, locate the **Compute Engine** service. Enable the API.

Create a new VM instance using these values:

    Name: hello
    Region: us-central1
    Machine series: N1
    Machine type: n1-standard-1

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L13-GCP-02-01.png)

In the Container section, click on the **Deploy Container** button and use these values:

    Container image: us-docker.pkg.dev/google-samples/containers/gke/hello-app:1.0
    Allocate a buffer for STDIN: checked
    Allocate a pseudo-TTY: checked

Add an environment variable

    Name: Hello
    Value: World!

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L13-GCP-02-02.png)

In the Firewall section:

    Allow HTTP traffic: checked

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L13-GCP-02-03.png)

Click the **Create** button.

List the compute instances

    gcloud compute instances list

## Is the container running?

Click on the **External IP** link to launch a browser. Oh no! It did not worked!

This image listens on port 8080, add :8080 to the URL and try again. It does not work.

Check if the container is running inside the VM by clicking on the **SSH** link.  This will open a new browser window. Click **Connect**.

![image](https://kubernetesacademy.online/wp-content/uploads/2022/07/L13-GCP-02-04.png)

Is the container running?

    docker ps

## Open port 8080

This image listens on port 8080 but it's likely not opened. List the firewall rules:

    gcloud compute firewall-rules list

Open it using:

    gcloud compute firewall-rules create allow-http-8080  --allow tcp:8080 --target-tags http-server
    gcloud compute firewall-rules list

Try again in the browser. Success!

## Cleanup

Delete the VM instance using the Console or the CLI

    gcloud compute firewall-rules delete allow-http-8080
    gcloud compute firewall-rules list

    gcloud compute instances delete hello
    gcloud compute instances list

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online

