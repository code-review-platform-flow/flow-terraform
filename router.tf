# Google Compute Router 설정
resource "google_compute_router" "router" {
  # 라우터의 이름을 지정합니다.
  name = var.router_name

  # 라우터가 위치할 지역을 지정합니다. (한국 지역: asia-northeast3)
  region = var.router_region

  # 라우터가 속할 VPC 네트워크를 지정합니다.
  network = google_compute_network.main.id
}