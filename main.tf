variable "project_id" {
  type    = string
  default = "assesment-380119"
}

variable "credentials_file" {
  type    = string
  default = "C:/Users/AISHWARYA/downloads/assesment-380119-51ff0c05ebf8.json"
}
provider "google" {
  credentials = file(var.credentials_file)  
  project     = var.project_id
  region      = "europe-west2"
  zone    = "europe-west2-a"
}
#variable "project_id" {
#default = var.project_id
#}

# Create a new VPC network
resource "google_compute_network" "vpc_network" {
  name                    = "assesment"
  auto_create_subnetworks = false
}

# Create a new subnet in London region
resource "google_compute_subnetwork" "subnet_london" {
  name          = "assessment-subnet-london"
  network       = google_compute_network.vpc_network.self_link
  region        = "europe-west2"
  ip_cidr_range = "10.0.0.0/24"
}

# Create a new service account
resource "google_service_account" "service_account" {
  account_id = "assessment-sa"
  display_name = "assessment"
}

# Assign roles to the service account
resource "google_project_iam_binding" "service_account_roles" {
  project = var.project_id
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.service_account.email}"
  ]
}

# Create the private GKE cluster
resource "google_container_cluster" "private_cluster" {
  name               = "assessment-private-cluster"
  location           = "europe-west2-a"
  remove_default_node_pool = true
  initial_node_count = 1
  networking_mode = "VPC_NATIVE"
  network = google_compute_network.vpc_network.self_link
  subnetwork = google_compute_subnetwork.subnet_london.self_link


  ip_allocation_policy {}
  master_authorized_networks_config {
    cidr_blocks{ 
       cidr_block = "0.0.0.0/0"
       display_name = "assessment"
 }

  }

  # Enable private nodes
  private_cluster_config {
    enable_private_nodes = true
    master_ipv4_cidr_block = "172.16.0.0/28"
  }

  # Use the created service account
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }


}
resource "google_container_node_pool" "assesment-preemptible-nodes" {
  name       = "assesment-preemptible-node-pool"
  location   = "europe-west2-a"
  cluster    = google_container_cluster.private_cluster.name
  initial_node_count = 0

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
 autoscaling {
    min_node_count = 0
    total_max_node_count = 4
   }

}


resource "google_container_node_pool" "assesment_primary_nodes" {
  name       = "assesment-primary-node-pool"
  location   = "europe-west2-a"
  cluster    = google_container_cluster.private_cluster.name
#  initial_node_count = 1
  node_count = 2

  node_config {
    machine_type = "e2-micro"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  #autoscaling {
   # min_node_count = 0
   # total_max_node_count = 4
  # }
}


# Allow the private cluster to access the internet
resource "google_compute_route" "private_cluster_internet_access" {
  name            = "private-cluster-internet-access"
  network         = google_compute_network.vpc_network.self_link
  dest_range      = "0.0.0.0/0"
  next_hop_gateway = "default-internet-gateway"
  priority        = 1000
}
