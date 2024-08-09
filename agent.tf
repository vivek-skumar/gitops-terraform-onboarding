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
  repository = "https://github.com/vivek-skumar/gitops-helm.git" # Replace with the actual Helm repo URL
  chart      = "gitops_agent"                # Replace with the actual chart name
  version    = "0.0.1"                       # Replace with the desired version

}
