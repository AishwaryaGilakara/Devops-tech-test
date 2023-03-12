variable "bigquery_role_assignment" {
  description = "A map of dataset names to role assignments."
  type        = map(object({
    role = string
    user = string
  }))
}

resource "google_bigquery_dataset_access" "vmo2_tech_test" {
  for_each = var.bigquery_role_assignment

  dataset_id = "vmo2_tech_test"
  role       = "OWNER"
  user_by_email = "agilakara@gmail.com"
  
  
}

  
  

