# Kubernetes 클러스터를 위한 서비스 계정 생성
resource "google_service_account" "kubernetes" {
  # 서비스 계정의 ID를 지정합니다.
  account_id = var.kubernetes_service_account_id
}

# Kubernetes 클러스터의 일반 노드 풀 설정
resource "google_container_node_pool" "general" {
  # 노드 풀의 이름을 지정합니다.
  name = var.node_pool_name

  # 이 노드 풀이 속할 Kubernetes 클러스터를 지정합니다.
  cluster = google_container_cluster.primary.id

  # 노드 풀의 초기 노드 개수를 지정합니다.
  node_count = 2

  # 노드 관리 설정
  management {
    # 노드 자동 복구를 활성화합니다.
    auto_repair = true

    # 노드 자동 업그레이드를 활성화합니다.
    auto_upgrade = true
  }

  # 노드 구성 설정
  node_config {
    # 노드를 비프리엠티블로 설정합니다.
    preemptible = false

    # 머신 타입을 지정합니다.
    machine_type = "e2-medium"

    # 노드에 적용할 레이블을 지정합니다.
    labels = {
      role = "general"
    }

    # 서비스 계정을 지정합니다.
    service_account = google_service_account.kubernetes.email

    # OAuth 스코프를 지정합니다.
    oauth_scopes = var.oauth_scopes
    disk_size_gb = 50
  }
}

resource "google_container_node_pool" "spot" {
  name    = "spot"
  cluster = google_container_cluster.primary.id

  initial_node_count = 1

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 10
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    labels = {
      team = "devops"
    }

    taint {
      key    = "instance_type"
      value  = "spot"
      effect = "NO_SCHEDULE"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}