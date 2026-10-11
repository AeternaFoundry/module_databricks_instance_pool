output "instance_pools_id" {
  description = "Map of id values across all instance_pools, keyed the same as var.instance_pools except keys with no id are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "instance_pools_aws_attributes" {
  description = "Map of aws_attributes values across all instance_pools, keyed the same as var.instance_pools except keys with no aws_attributes are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.aws_attributes) if v.aws_attributes != null && length(v.aws_attributes) > 0 }
}
output "instance_pools_azure_attributes" {
  description = "Map of azure_attributes values across all instance_pools, keyed the same as var.instance_pools except keys with no azure_attributes are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.azure_attributes) if v.azure_attributes != null && length(v.azure_attributes) > 0 }
}
output "instance_pools_custom_tags" {
  description = "Map of custom_tags values across all instance_pools, keyed the same as var.instance_pools except keys with no custom_tags are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.custom_tags if v.custom_tags != null && length(v.custom_tags) > 0 }
}
output "instance_pools_disk_spec" {
  description = "Map of disk_spec values across all instance_pools, keyed the same as var.instance_pools except keys with no disk_spec are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.disk_spec) if v.disk_spec != null && length(v.disk_spec) > 0 }
}
output "instance_pools_enable_elastic_disk" {
  description = "Map of enable_elastic_disk values across all instance_pools, keyed the same as var.instance_pools except keys with no enable_elastic_disk are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.enable_elastic_disk if v.enable_elastic_disk != null }
}
output "instance_pools_gcp_attributes" {
  description = "Map of gcp_attributes values across all instance_pools, keyed the same as var.instance_pools except keys with no gcp_attributes are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.gcp_attributes) if v.gcp_attributes != null && length(v.gcp_attributes) > 0 }
}
output "instance_pools_idle_instance_autotermination_minutes" {
  description = "Map of idle_instance_autotermination_minutes values across all instance_pools, keyed the same as var.instance_pools except keys with no idle_instance_autotermination_minutes are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.idle_instance_autotermination_minutes if v.idle_instance_autotermination_minutes != null }
}
output "instance_pools_instance_pool_fleet_attributes" {
  description = "Map of instance_pool_fleet_attributes values across all instance_pools, keyed the same as var.instance_pools except keys with no instance_pool_fleet_attributes are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.instance_pool_fleet_attributes) if v.instance_pool_fleet_attributes != null && length(v.instance_pool_fleet_attributes) > 0 }
}
output "instance_pools_instance_pool_id" {
  description = "Map of instance_pool_id values across all instance_pools, keyed the same as var.instance_pools except keys with no instance_pool_id are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.instance_pool_id if v.instance_pool_id != null && length(v.instance_pool_id) > 0 }
}
output "instance_pools_instance_pool_name" {
  description = "Map of instance_pool_name values across all instance_pools, keyed the same as var.instance_pools except keys with no instance_pool_name are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.instance_pool_name if v.instance_pool_name != null && length(v.instance_pool_name) > 0 }
}
output "instance_pools_max_capacity" {
  description = "Map of max_capacity values across all instance_pools, keyed the same as var.instance_pools except keys with no max_capacity are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.max_capacity if v.max_capacity != null }
}
output "instance_pools_min_idle_instances" {
  description = "Map of min_idle_instances values across all instance_pools, keyed the same as var.instance_pools except keys with no min_idle_instances are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.min_idle_instances if v.min_idle_instances != null }
}
output "instance_pools_node_type_flexibility" {
  description = "Map of node_type_flexibility values across all instance_pools, keyed the same as var.instance_pools except keys with no node_type_flexibility are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.node_type_flexibility) if v.node_type_flexibility != null && length(v.node_type_flexibility) > 0 }
}
output "instance_pools_node_type_id" {
  description = "Map of node_type_id values across all instance_pools, keyed the same as var.instance_pools except keys with no node_type_id are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.node_type_id if v.node_type_id != null && length(v.node_type_id) > 0 }
}
output "instance_pools_preloaded_docker_image" {
  description = "Map of preloaded_docker_image values across all instance_pools, keyed the same as var.instance_pools except keys with no preloaded_docker_image are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.preloaded_docker_image if v.preloaded_docker_image != null && length(v.preloaded_docker_image) > 0 }
  sensitive   = true
}
output "instance_pools_preloaded_spark_versions" {
  description = "Map of preloaded_spark_versions values across all instance_pools, keyed the same as var.instance_pools except keys with no preloaded_spark_versions are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => v.preloaded_spark_versions if v.preloaded_spark_versions != null && length(v.preloaded_spark_versions) > 0 }
}
output "instance_pools_provider_config" {
  description = "Map of provider_config values across all instance_pools, keyed the same as var.instance_pools except keys with no provider_config are omitted"
  value       = { for k, v in databricks_instance_pool.instance_pools : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}

