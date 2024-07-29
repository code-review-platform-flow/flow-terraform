# VPC 서브네트워크 설정
resource "google_compute_subnetwork" "private" {
  # 서브네트워크의 이름을 지정합니다.
  name = var.subnet_name

  # 서브네트워크의 기본 IP CIDR 범위를 지정합니다.
  ip_cidr_range = var.subnet_ip_cidr_range

  # 서브네트워크가 위치할 지역을 지정합니다. (한국 지역: asia-northeast3)
  region = var.subnet_region

  # 이 서브네트워크가 속할 VPC 네트워크를 지정합니다.
  network = google_compute_network.main.id

  # Google Cloud 리소스에서 이 서브네트워크의 프라이빗 IP에 접근할 수 있도록 설정합니다.
  private_ip_google_access = true

  # Kubernetes Pod의 secondary IP CIDR 범위를 지정합니다.
  secondary_ip_range {
    range_name = "k8s-pod-range"
    ip_cidr_range = var.k8s_pod_ip_cidr_range
  }

  # Kubernetes 서비스의 secondary IP CIDR 범위를 지정합니다.
  secondary_ip_range {
    range_name = "k8s-service-range"
    ip_cidr_range = var.k8s_service_ip_cidr_range
  }
}