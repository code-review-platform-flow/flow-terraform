# Google Kubernetes Engine 클러스터 설정
resource "google_container_cluster" "primary" {
  # 클러스터 이름을 지정합니다.
  name = var.cluster_name

  # 클러스터가 위치할 지역을 지정합니다. (한국 지역: asia-northeast3-a)
  location = var.cluster_location

  # 기본 노드 풀을 제거합니다.
  remove_default_node_pool = true

  # 초기 노드 개수를 설정합니다.
  initial_node_count = 1

  # 클러스터가 속할 VPC 네트워크를 지정합니다.
  network = google_compute_network.main.self_link

  # 클러스터가 속할 서브네트워크를 지정합니다.
  subnetwork = google_compute_subnetwork.private.self_link

  # 네트워킹 모드를 VPC 네이티브 모드로 설정합니다.
  networking_mode = "VPC_NATIVE"

  # 릴리즈 채널 설정
  release_channel {
    # 릴리즈 채널을 정규 채널로 설정합니다.
    channel = "REGULAR"
  }

  # 워크로드 아이덴티티 설정
  workload_identity_config {
    # 워크로드 풀을 설정합니다.
    workload_pool = var.workload_pool
  }

  # IP 할당 정책 설정
  ip_allocation_policy {
    # 클러스터의 세컨더리 IP 범위 이름을 지정합니다.
    cluster_secondary_range_name = var.cluster_secondary_range_name

    # 서비스의 세컨더리 IP 범위 이름을 지정합니다.
    services_secondary_range_name = var.services_secondary_range_name
  }

  # 프라이빗 클러스터 설정
  private_cluster_config {
    # 프라이빗 노드를 활성화합니다.
    enable_private_nodes = true

    # 프라이빗 엔드포인트를 비활성화합니다.
    enable_private_endpoint = false

    # 마스터 노드의 IPv4 CIDR 블록을 지정합니다.
    master_ipv4_cidr_block = var.master_ipv4_cidr_block
  }

  # 애드온 설정
  addons_config {
    # HTTP 로드 밸런싱을 비활성화합니다.
    http_load_balancing {
      disabled = true
    }

    # 수평 파드 오토스케일링을 활성화합니다.
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

}
