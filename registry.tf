# Google Artifact Registry Repository (개발 환경)
resource "google_artifact_registry_repository" "repo_dev" {
  provider = google
  location = var.repo_location
  repository_id = var.repo_dev_id
  description = var.repo_dev_description
  format = "DOCKER"
}

# Google Artifact Registry Repository (운영 환경)
resource "google_artifact_registry_repository" "repo_prd" {
  provider = google
  location = var.repo_location
  repository_id = var.repo_prd_id
  description = var.repo_prd_description
  format = "DOCKER"
}