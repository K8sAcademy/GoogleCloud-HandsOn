# L40-GCP-02

Let's deploy Prometheus and Grafana in our cluster.

## Prometheus Stack

    kubectl create ns prometheus-stack
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update
    helm install prometheus-stack prometheus-community/kube-prometheus-stack -n prometheus-stack

## Validate that all pods the monitoring pods are running

    kubectl -n prometheus-stack get pods     

## Create the deployment

    kubectl apply -f deploy.yaml

## Set the autoscaling limits

    kubectl autoscale deployment hpa-deployment --cpu-percent=25 --min=1 --max=20

## Port-forward

    kubectl port-forward service/hpa-svc 8080:8080   

## Launch a browser

Launch the Kuard Web app using the IP address you got earlier.

Click on Keygen Workload, check the Enabled checkbox and click on Submit.

## Expose the Grafana dashboard

Deploy a load balancer

    kubectl apply -f lb.yaml

Username: admin
Password: prom-operator

## Open a Grafana dashboard

Click on the **dashboard icon** and select **Manage**.

Select **Nodes**.

You should see some metrics for the nodes.

## Delete the autoscaler

    kubectl delete hpa hpa-deployment

## Cleanup

    kubectl delete -f deploy.yaml
    kubectl delete -f lb.yaml
 
Uninstall the Prometheus stack

    helm uninstall prometheus-stack -n prometheus-stack

Uninstall the Prometheus stack CRDs

    kubectl delete crd alertmanagerconfigs.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd alertmanagers.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd podmonitors.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd probes.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd prometheuses.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd prometheusrules.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd servicemonitors.monitoring.coreos.com -n prometheus-stack
    kubectl delete crd thanosrulers.monitoring.coreos.com -n prometheus-stack
