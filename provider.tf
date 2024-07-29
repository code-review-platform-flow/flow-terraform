# Google Cloud Provider 설정
provider "google" {
  # 사용할 GCP 프로젝트 ID를 지정합니다.
  project = var.gcp_project_id

  # 리소스가 위치할 기본 지역을 지정합니다. (한국 지역: asia-northeast3)
  region = var.gcp_region
}

# Terraform 설정
terraform {
  # Terraform 상태를 저장할 GCS 백엔드 설정
  backend "gcs" {
    # 상태 파일을 저장할 GCS 버킷 이름을 지정합니다.
    bucket = "flow-tf-state-staging"

    # 상태 파일 경로의 접두사를 지정합니다.
    prefix = "terraform/state"
  }

  # 필수 제공자 설정
  required_providers {
    # Google 제공자의 소스와 버전을 지정합니다.
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}