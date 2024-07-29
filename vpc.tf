# Compute Engine API 활성화
resource "google_project_service" "compute" {
  # Compute Engine API를 활성화하여 GCP 프로젝트에서 사용할 수 있도록 설정합니다.
  service = "compute.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy = false
}

# Kubernetes Engine API 활성화
resource "google_project_service" "container" {
  # Kubernetes Engine API를 활성화하여 GCP 프로젝트에서 사용할 수 있도록 설정합니다.
  service = "container.googleapis.com"
  disable_dependent_services = true
  disable_on_destroy = false
}

# VPC 네트워크 설정
resource "google_compute_network" "main" {
  # VPC 네트워크의 이름을 지정합니다.
  name = var.vpc_network_name

  # 네트워크의 라우팅 모드를 지역적으로 설정합니다.
  routing_mode = "REGIONAL"

  # 자동 서브넷 생성 비활성화
  # 네트워크에 서브넷을 자동으로 생성하지 않도록 설정합니다.
  auto_create_subnetworks = false

  # 최대 전송 단위(MTU)를 1460으로 설정합니다.
  mtu = 1460

  # 기본 경로 삭제 비활성화
  # 네트워크 생성 시 기본 경로를 삭제하지 않도록 설정합니다.
  delete_default_routes_on_create = false

  # VPC 네트워크 리소스가 Compute Engine API와 Kubernetes Engine API에 종속되도록 설정합니다.
  depends_on = [ 
    google_project_service.compute,   # Compute Engine API가 활성화된 후에 생성
    google_project_service.container  # Kubernetes Engine API가 활성화된 후에 생성
  ]
}
