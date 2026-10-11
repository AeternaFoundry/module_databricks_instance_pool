variable "instance_pools" {
  description = <<EOT
Map of instance_pools, attributes below
Required:
    - idle_instance_autotermination_minutes
    - instance_pool_name
Optional:
    - custom_tags
    - enable_elastic_disk
    - instance_pool_id
    - max_capacity
    - min_idle_instances
    - node_type_id
    - preloaded_spark_versions
    - aws_attributes (block):
        - availability (optional)
        - instance_profile_arn (optional)
        - spot_bid_price_percent (optional)
        - zone_id (optional)
    - azure_attributes (block):
        - availability (optional)
        - spot_bid_max_price (optional)
    - disk_spec (block):
        - disk_count (optional)
        - disk_size (optional)
        - disk_type (optional, block):
            - azure_disk_volume_type (optional)
            - ebs_volume_type (optional)
    - gcp_attributes (block):
        - gcp_availability (optional)
        - local_ssd_count (optional)
        - zone_id (optional)
    - instance_pool_fleet_attributes (block):
        - fleet_on_demand_option (optional, block):
            - allocation_strategy (required)
            - instance_pools_to_use_count (optional)
        - fleet_spot_option (optional, block):
            - allocation_strategy (required)
            - instance_pools_to_use_count (optional)
        - launch_template_override (required, block):
            - availability_zone (required)
            - instance_type (required)
    - node_type_flexibility (block):
        - alternate_node_type_ids (required)
    - preloaded_docker_image (block):
        - basic_auth (optional, block):
            - password (required)
            - username (required)
        - url (required)
    - provider_config (block):
        - workspace_id (optional)
EOT

  type = map(object({
    idle_instance_autotermination_minutes = number
    instance_pool_name                    = string
    custom_tags                           = optional(map(string))
    enable_elastic_disk                   = optional(bool)
    instance_pool_id                      = optional(string)
    max_capacity                          = optional(number)
    min_idle_instances                    = optional(number)
    node_type_id                          = optional(string)
    preloaded_spark_versions              = optional(list(string))
    aws_attributes = optional(object({
      availability           = optional(string)
      instance_profile_arn   = optional(string)
      spot_bid_price_percent = optional(number)
      zone_id                = optional(string)
    }))
    azure_attributes = optional(object({
      availability       = optional(string)
      spot_bid_max_price = optional(number)
    }))
    disk_spec = optional(object({
      disk_count = optional(number)
      disk_size  = optional(number)
      disk_type = optional(object({
        azure_disk_volume_type = optional(string)
        ebs_volume_type        = optional(string)
      }))
    }))
    gcp_attributes = optional(object({
      gcp_availability = optional(string)
      local_ssd_count  = optional(number)
      zone_id          = optional(string)
    }))
    instance_pool_fleet_attributes = optional(object({
      fleet_on_demand_option = optional(object({
        allocation_strategy         = string
        instance_pools_to_use_count = optional(number)
      }))
      fleet_spot_option = optional(object({
        allocation_strategy         = string
        instance_pools_to_use_count = optional(number)
      }))
      launch_template_override = list(object({
        availability_zone = string
        instance_type     = string
      }))
    }))
    node_type_flexibility = optional(object({
      alternate_node_type_ids = list(string)
    }))
    preloaded_docker_image = optional(list(object({
      basic_auth = optional(object({
        password = string
        username = string
      }))
      url = string
    })))
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.instance_pools : (
        v.instance_pool_fleet_attributes == null || (length(v.instance_pool_fleet_attributes.launch_template_override) >= 1)
      )
    ])
    error_message = "Each launch_template_override list must contain at least 1 items"
  }
}

