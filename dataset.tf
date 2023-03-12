resource "google_bigquery_dataset" "vmo2_tech_test" {
  dataset_id                  = "vmo2_tech_test"
  project                     = var.project_id
  friendly_name               = "tech test dataset"
  description                 = "This is the dataset for the given vm02_tech_test"
  location                    = "europe-west2"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "owner"
    user_by_email = google_service_account.bqowner.email
  }
}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}
