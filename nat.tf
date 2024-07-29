# Google Compute Router NAT 설정
resource "google_compute_router_nat" "nat" {
  # NAT 설정의 이름을 지정합니다.
  name = var.nat_name

  # NAT 설정이 속할 라우터를 지정합니다.
  router = google_compute_router.router.name

  # NAT 설정이 위치할 지역을 지정합니다. (한국 지역: asia-northeast3)
  region = var.nat_region

  # NAT를 적용할 서브네트워크 IP 범위를 지정합니다.
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  # NAT IP 할당 옵션을 수동으로 설정합니다.
  nat_ip_allocate_option = "MANUAL_ONLY"

  # 서브네트워크 설정
  subnetwork {
    # NAT를 적용할 서브네트워크 이름을 지정합니다.
    name = google_compute_subnetwork.private.id

    # NAT를 적용할 IP 범위를 지정합니다.
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  # NAT IP 주소를 지정합니다.
  nat_ips = [google_compute_address.nat.self_link]
}

# 외부 IP 주소 생성
resource "google_compute_address" "nat" {
  # 외부 IP 주소의 이름을 지정합니다.
  name = var.nat_name

  # IP 주소 타입을 외부 주소로 설정합니다.
  address_type = "EXTERNAL"

  # 네트워크 계층을 프리미엄으로 설정합니다.
  network_tier = "PREMIUM"
}
