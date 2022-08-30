output "endpoint" {
  value = data.google_container_cluster.my_cluster.endpoint
}

output "machine_type" {
  value = data.google_container_cluster.my_cluster.node_config.0.machine_type
}

output "initial_node_count" {
  value = data.google_container_cluster.my_cluster.node_pool.0.initial_node_count
}