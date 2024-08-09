resource "harness_platform_gitops_agent" "gitops_agent" {
  identifier = var.agent_identifier
  account_id = var.account_id
  project_id = var.project_id
  org_id     = var.org_id
  name       = var.agent_name
  type       = "MANAGED_ARGO_PROVIDER"
  metadata {
    namespace         = var.agent_namespace
    high_availability = false
  }
}

resource "helm_release" "gitops_agent" {
  name       = "gitops-agent"
  repository = "https://github.com/vivek-skumar/gitops-helm.git" 
  chart      = "gitops_agent"               
  version    = "0.0.1"                      

  # Add additional `set` blocks as needed for your chart's configuration
}

output "gitops_agent_status" {
  value = helm_release.gitops_agent.status
}

locals {
  deploy_agent_resources_to_cluster = helm_release.gitops_agent.status == "deployed" ? "Helm chart deployed successfully" : "Helm chart deployment failed"
}

output "deploy_agent_resources_to_cluster" {
  value = local.deploy_agent_resources_to_cluster
}
