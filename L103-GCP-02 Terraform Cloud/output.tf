output "endpoint" {
  value = data.google_container_cluster.my_cluster.endpoint
}

output "node_config" {
  value = data.google_container_cluster.my_cluster.node_config
}

output "node_pools" {
  value = data.google_container_cluster.my_cluster.node_pool
}