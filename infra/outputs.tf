output "vpc_id" {
  value       = digitalocean_vpc.echo_vpc.id
  description = "VPC ID"
}

output "valkey_private_uri" {
  value       = digitalocean_database_cluster.valkey.private_uri
  description = "Valkey connection URI"
  sensitive   = true
}

output "postgres_private_uri" {
  value       = digitalocean_database_cluster.postgres.private_uri
  description = "Postgres connection URI"
  sensitive   = true
}

output "postgres_pool_uri" {
  value       = digitalocean_database_connection_pool.postgres_pool.uri
  description = "Postgres connection URI"
  sensitive   = true
}

output "registry_url" {
  value       = local.env == "prod" ? null : digitalocean_container_registry.registry[0].endpoint
  description = "Container registry URL"
}

output "spaces_endpoint" {
  value       = digitalocean_spaces_bucket.uploads.endpoint
  description = "Spaces endpoint"
}

# spaces doesn't allow to create keys yet
# so create them manually
# https://github.com/digitalocean/terraform-provider-digitalocean/issues/880
# https://github.com/digitalocean/doctl/issues/936

// spaces output
// ams3.digitaloceanspaces.com
// bucket name (dev)  : dbr-echo-dev-uploads.ams3.digitaloceanspaces.com
// bucket name (prod) : dbr-echo-prod-uploads.ams3.digitaloceanspaces.com

# output "ingress_lb_ip" {
#   value = digitalocean_reserved_ip.echo_lb_ip.ip_address
# }
