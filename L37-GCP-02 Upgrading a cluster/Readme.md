# L37-GCP-02

## Upgrading a cluster

## Using the Console

Using the Console is the easiest way. Select your cluster and click on the **Upgrade Available** icon.

---

# Using the CLI

## Are there new versions available?

    gcloud container get-server-config --region=us-central1  --flatten=channels --filter="channels.channel=REGULAR"

Filter the default version

    gcloud container get-server-config --region=us-central1  --flatten=channels --filter="channels.channel=REGULAR" --format="value(channels.defaultVersion)"

## Upgrade the cluster to a newer version

    gcloud container clusters upgrade CLUSTER_NAME --master --cluster-version VERSION

This will trigger an upgrade to the node pools if they are set for auto-upgrade.

## Upgrade a node pool to a newer version

Trigger an update for node pools not set for auto-upgrade.

    gcloud container clusters upgrade CLUSTER_NAME --node-pool=NODE_POOL_NAME
