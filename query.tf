variable "bigquery_role_assignment" {
  description = "A map of dataset names to role assignments."
  type        = map(object({
    role = string
    user = string
  }))
  default     = {
    vmo2_tech_test = {
      role = "roles/bigquery.dataEditor"
      user = "google_service_account.service_account.email"
    }
  }
}

module "bigquery_access" {
  source = "./modules/bigquery_access"

  bigquery_role_assignment = var.bigquery_role_assignment
}