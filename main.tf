resource "databricks_instance_pool" "instance_pools" {
  for_each = var.instance_pools

  idle_instance_autotermination_minutes = each.value.idle_instance_autotermination_minutes
  instance_pool_name                    = each.value.instance_pool_name
  custom_tags                           = each.value.custom_tags
  enable_elastic_disk                   = each.value.enable_elastic_disk
  instance_pool_id                      = each.value.instance_pool_id
  max_capacity                          = each.value.max_capacity
  min_idle_instances                    = each.value.min_idle_instances
  node_type_id                          = each.value.node_type_id
  preloaded_spark_versions              = each.value.preloaded_spark_versions

  dynamic "aws_attributes" {
    for_each = each.value.aws_attributes != null ? [each.value.aws_attributes] : []
    content {
      availability           = aws_attributes.value.availability
      instance_profile_arn   = aws_attributes.value.instance_profile_arn
      spot_bid_price_percent = aws_attributes.value.spot_bid_price_percent
      zone_id                = aws_attributes.value.zone_id
    }
  }

  dynamic "azure_attributes" {
    for_each = each.value.azure_attributes != null ? [each.value.azure_attributes] : []
    content {
      availability       = azure_attributes.value.availability
      spot_bid_max_price = azure_attributes.value.spot_bid_max_price
    }
  }

  dynamic "disk_spec" {
    for_each = each.value.disk_spec != null ? [each.value.disk_spec] : []
    content {
      disk_count = disk_spec.value.disk_count
      disk_size  = disk_spec.value.disk_size
      dynamic "disk_type" {
        for_each = disk_spec.value.disk_type != null ? [disk_spec.value.disk_type] : []
        content {
          azure_disk_volume_type = disk_type.value.azure_disk_volume_type
          ebs_volume_type        = disk_type.value.ebs_volume_type
        }
      }
    }
  }

  dynamic "gcp_attributes" {
    for_each = each.value.gcp_attributes != null ? [each.value.gcp_attributes] : []
    content {
      gcp_availability = gcp_attributes.value.gcp_availability
      local_ssd_count  = gcp_attributes.value.local_ssd_count
      zone_id          = gcp_attributes.value.zone_id
    }
  }

  dynamic "instance_pool_fleet_attributes" {
    for_each = each.value.instance_pool_fleet_attributes != null ? [each.value.instance_pool_fleet_attributes] : []
    content {
      dynamic "fleet_on_demand_option" {
        for_each = instance_pool_fleet_attributes.value.fleet_on_demand_option != null ? [instance_pool_fleet_attributes.value.fleet_on_demand_option] : []
        content {
          allocation_strategy         = fleet_on_demand_option.value.allocation_strategy
          instance_pools_to_use_count = fleet_on_demand_option.value.instance_pools_to_use_count
        }
      }
      dynamic "fleet_spot_option" {
        for_each = instance_pool_fleet_attributes.value.fleet_spot_option != null ? [instance_pool_fleet_attributes.value.fleet_spot_option] : []
        content {
          allocation_strategy         = fleet_spot_option.value.allocation_strategy
          instance_pools_to_use_count = fleet_spot_option.value.instance_pools_to_use_count
        }
      }
      dynamic "launch_template_override" {
        for_each = instance_pool_fleet_attributes.value.launch_template_override
        content {
          availability_zone = launch_template_override.value.availability_zone
          instance_type     = launch_template_override.value.instance_type
        }
      }
    }
  }

  dynamic "node_type_flexibility" {
    for_each = each.value.node_type_flexibility != null ? [each.value.node_type_flexibility] : []
    content {
      alternate_node_type_ids = node_type_flexibility.value.alternate_node_type_ids
    }
  }

  dynamic "preloaded_docker_image" {
    for_each = each.value.preloaded_docker_image != null ? each.value.preloaded_docker_image : []
    content {
      dynamic "basic_auth" {
        for_each = preloaded_docker_image.value.basic_auth != null ? [preloaded_docker_image.value.basic_auth] : []
        content {
          password = basic_auth.value.password
          username = basic_auth.value.username
        }
      }
      url = preloaded_docker_image.value.url
    }
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

