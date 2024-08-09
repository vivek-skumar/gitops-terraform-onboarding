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

data "git_repository" "my_chart_repo" {
  repository = "https://github.com/vivek-skumar/gitops-helm.git"
  directory  = "gitops-agent"
}

resource "helm_release" "gitops_agent" {
  name        = "gitops-agent"
  namespace   = "default"
  repository  = data.git_repository.my_chart_repo.repository
}
