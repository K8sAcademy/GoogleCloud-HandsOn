# L34-GCP-04

![Hands-On Files](https://kubernetesacademy.online/wp-content/uploads/2021/06/checked-files-50px.png)

## Filestore CSI driver

If you haven't installed the Filestore CSI driver at the cluster (standard) creation, you can enable it using

    gcloud container clusters update [CLUSTER_NAME] --zone us-central1-c --update-addons=GcpFilestoreCsiDriver=ENABLED

Note that the driver is installed by default in Autopilot clusters.

## Validate that the default StorageClasses are available

    kubectl get sc

Note that if you just enabled the CSI driver, the StorageClasses will take a few minutes to appear.

## Deploy the claim

    kubectl apply -f pvc.yaml

This will take a few minutes to provision.

## Look at the pvc

    kubectl get pvc

## Deploy the pod

    kubectl apply -f pod.yaml

## Connect to the Busybox

    kubectl exec mybox -it -- /bin/sh

## Create a file

    ls
    cd filestoredisk
    echo Hello World > hello.txt
    ls
    exit

## Delete and create the Pod again

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl apply -f pod.yaml

## Connect to the Busybox

    kubectl exec mybox -it -- /bin/sh
    cd filestoredisk
    ls
    cat hello.txt
    exit

## Cleanup

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl delete -f pvc.yaml

---

© Copyright AZCode, All Rights Reserved | https://kubernetesacademy.online