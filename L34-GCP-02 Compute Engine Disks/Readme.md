# L34-GCP-03

Compute Engine Persistent Disks

## Validate that the default StorageClasses are available

    kubectl get sc

## Deploy the claim

    kubectl apply -f pvc.yaml

## Look at the pvc

    kubectl get pvc

## Deploy the pod

    kubectl apply -f pod.yaml

## Connect to the Busybox

    kubectl exec mybox -it -- /bin/sh

## Create a file

    ls
    cd standarddisk
    echo Hello World > hello.txt
    ls
    exit

## Delete and create the Pod again

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl apply -f pod.yaml

## Connect to the Busybox

    kubectl exec mybox -it -- /bin/sh
    cd standarddisk
    ls
    cat hello.txt
    exit

## Cleanup

    kubectl delete -f pod.yaml --grace-period=0 --force
    kubectl delete -f pvc.yaml

