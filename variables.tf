variable "vpc_network_name" {
  description = "VPC 네트워크 이름"
  type        = string
}

# 서브네트워크 변수
variable "subnet_name" {
  description = "서브네트워크 이름"
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "서브네트워크 IP CIDR 범위"
  type        = string
}

variable "subnet_region" {
  description = "서브네트워크 지역"
  type        = string
}

variable "k8s_pod_ip_cidr_range" {
  description = "Kubernetes Pod의 secondary IP CIDR 범위"
  type        = string
}

variable "k8s_service_ip_cidr_range" {
  description = "Kubernetes 서비스의 secondary IP CIDR 범위"
  type        = string
}

# Google Cloud Storage 버킷 변수
variable "storage_name_dev" {
  description = "개발 환경용 Storage 버킷 이름"
  type        = string
}

variable "storage_name_prd" {
  description = "운영 환경용 Storage 버킷 이름"
  type        = string
}

variable "storage_location" {
  description = "Storage 버킷 위치"
  type        = string
}

# 서비스 계정 변수
variable "service_account_id" {
  description = "서비스 계정 ID"
  type        = string
}

# 프로젝트 변수
variable "project_id" {
  description = "GCP 프로젝트 ID"
  type        = string
}

# IAM 역할 변수
variable "storage_admin_role" {
  description = "Storage 관리자 역할"
  type        = string
}

variable "workload_identity_role" {
  description = "Workload Identity 사용자 역할"
  type        = string
}

variable "artifact_registry_role" {
  description = "Artifact Registry 읽기 권한 역할"
  type        = string
}

# IAM 멤버 변수
variable "k8s_service_account_member" {
  description = "Kubernetes 서비스 계정 멤버"
  type        = string
}

# Google Compute Router 변수
variable "router_name" {
  description = "Google Compute Router 이름"
  type        = string
}

variable "router_region" {
  description = "Google Compute Router 지역"
  type        = string
}

# Google Artifact Registry Repository 변수
variable "repo_location" {
  description = "Artifact Registry 저장소 위치"
  type        = string
}

variable "repo_dev_id" {
  description = "개발 환경용 Artifact Registry 저장소 ID"
  type        = string
}

variable "repo_prd_id" {
  description = "운영 환경용 Artifact Registry 저장소 ID"
  type        = string
}

variable "repo_dev_description" {
  description = "개발 환경용 Artifact Registry 저장소 설명"
  type        = string
}

variable "repo_prd_description" {
  description = "운영 환경용 Artifact Registry 저장소 설명"
  type        = string
}

# Google Cloud Provider 변수
variable "gcp_project_id" {
  description = "GCP 프로젝트 ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP 리소스 기본 지역"
  type        = string
}

# Kubernetes 클러스터 서비스 계정 변수
variable "kubernetes_service_account_id" {
  description = "Kubernetes 클러스터 서비스 계정 ID"
  type        = string
}

# Kubernetes 노드 풀 변수
variable "node_pool_name" {
  description = "Kubernetes 노드 풀 이름"
  type        = string
}

variable "node_count" {
  description = "Kubernetes 노드 풀 초기 노드 개수"
  type        = number
}

variable "machine_type" {
  description = "Kubernetes 노드 머신 타입"
  type        = string
}

variable "oauth_scopes" {
  description = "Kubernetes 노드 OAuth 스코프"
  type        = list(string)
}

# Google Compute Router NAT 변수
variable "nat_name" {
  description = "NAT 설정 이름"
  type        = string
}

variable "nat_region" {
  description = "NAT 설정 지역"
  type        = string
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "NAT를 적용할 서브네트워크 IP 범위"
  type        = string
}

variable "nat_subnetwork_name" {
  description = "NAT를 적용할 서브네트워크 이름"
  type        = string
}

variable "nat_ip" {
  description = "NAT IP 주소"
  type        = list(string)
}

# Google Kubernetes Engine 클러스터 변수
variable "cluster_name" {
  description = "Kubernetes 클러스터 이름"
  type        = string
}

variable "cluster_location" {
  description = "Kubernetes 클러스터 지역"
  type        = string
}

variable "vpc_network" {
  description = "Kubernetes 클러스터가 속할 VPC 네트워크"
  type        = string
}

variable "subnetwork" {
  description = "Kubernetes 클러스터가 속할 서브네트워크"
  type        = string
}

variable "workload_pool" {
  description = "Kubernetes 클러스터 워크로드 풀"
  type        = string
}

variable "cluster_secondary_range_name" {
  description = "클러스터의 세컨더리 IP 범위 이름"
  type        = string
}

variable "services_secondary_range_name" {
  description = "서비스의 세컨더리 IP 범위 이름"
  type        = string
}

variable "master_ipv4_cidr_block" {
  description = "마스터 노드의 IPv4 CIDR 블록"
  type        = string
}

# Google Compute Firewall 변수
variable "ssh_firewall_name" {
  description = "ssh 방화벽 규칙 이름"
  type        = string
}

variable "http_https_firewall_name" {
  description = "http https 방화벽 규칙 이름"
  type        = string
}

variable "firewall_network" {
  description = "방화벽 규칙이 속할 네트워크"
  type        = string
}

variable "firewall_source_ranges" {
  description = "방화벽 규칙 소스 IP 범위"
  type        = list(string)
}

# Cloud SQL for PostgreSQL 변수
variable "db_instance_name_dev" {
  description = "개발 환경용 Cloud SQL 인스턴스 이름"
  type        = string
}

variable "db_instance_name_prd" {
  description = "프로덕션 환경용 Cloud SQL 인스턴스 이름"
  type        = string
}

variable "db_region" {
  description = "Cloud SQL 인스턴스 지역"
  type        = string
}

variable "db_tier" {
  description = "Cloud SQL 인스턴스 머신 타입"
  type        = string
}

variable "authorized_network_name" {
  description = "승인된 네트워크 이름"
  type        = string
}

variable "authorized_network_value" {
  description = "승인된 네트워크 값"
  type        = string
}

variable "db_user_name_dev" {
  description = "개발 환경용 데이터베이스 사용자 이름"
  type        = string
}

variable "db_user_name_prd" {
  description = "프로덕션 환경용 데이터베이스 사용자 이름"
  type        = string
}

variable "db_user_password_dev" {
  description = "개발 환경용 데이터베이스 사용자 비밀번호"
  type        = string
}

variable "db_user_password_prd" {
  description = "프로덕션 환경용 데이터베이스 사용자 비밀번호"
  type        = string
}
