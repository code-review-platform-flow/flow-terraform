# 서비스 계정 생성
resource "google_service_account" "flow-nextjs-dev" {
  # 서비스 계정의 ID를 지정합니다.
  account_id = var.service_account_id
}

# 프로젝트 IAM 멤버 설정
resource "google_project_iam_member" "flow-nextjs-dev" {
  # IAM 멤버가 속할 프로젝트를 지정합니다.
  project = var.project_id

  # IAM 멤버에게 부여할 역할을 지정합니다. (Storage 관리자 역할)
  role    = var.storage_admin_role

  # IAM 멤버를 지정합니다. (서비스 계정)
  member  = "serviceAccount:${google_service_account.flow-nextjs-dev.email}"
}

# 서비스 계정 IAM 멤버 설정
resource "google_service_account_iam_member" "flow-nextjs-dev" {
  # IAM 멤버가 속할 서비스 계정 ID를 지정합니다.
  service_account_id = google_service_account.flow-nextjs-dev.id

  # IAM 멤버에게 부여할 역할을 지정합니다. (Workload Identity 사용자 역할)
  role               = var.workload_identity_role

  # IAM 멤버를 지정합니다. (Kubernetes 서비스 계정)
  member             = var.k8s_service_account_member
}

# 프로젝트 IAM 멤버 설정 (Artifact Registry에 대한 접근 권한)
resource "google_project_iam_member" "artifact-registry-reader" {
  project = var.project_id
  role    = var.artifact_registry_role
  member  = "serviceAccount:${google_service_account.flow-nextjs-dev.email}"
}