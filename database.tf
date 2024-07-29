# Cloud SQL for PostgreSQL 설정 - 개발 환경
resource "google_sql_database_instance" "postgres_dev" {
  # Cloud SQL 인스턴스 이름을 지정합니다.
  name = var.db_instance_name_dev

  # PostgreSQL 데이터베이스 버전을 지정합니다.
  database_version = "POSTGRES_13"

  # 인스턴스가 위치할 지역을 지정합니다. (한국 지역: asia-northeast3)
  region = var.db_region

  # 인스턴스 설정
  settings {
    # 인스턴스의 머신 타입을 지정합니다.
    tier = var.db_tier

    # 백업 구성 설정
    backup_configuration {
      # 백업 기능을 비활성화합니다.
      enabled = false
    }

    # IP 구성 설정
    ip_configuration {
      # 승인된 네트워크를 설정합니다.
      authorized_networks {
        # 네트워크 이름을 지정합니다.
        name = var.authorized_network_name

        # 모든 IP 주소를 허용합니다. (보안상 실제 환경에서는 제한된 IP만 허용해야 합니다)
        value = var.authorized_network_value
      }
    }

    insights_config {
      query_insights_enabled  = false
      query_plans_per_minute  = 0
      query_string_length     = 1024
      record_application_tags = false
      record_client_address   = false
    }

    database_flags {
      name  = "max_connections"
      value = "100" # 원하는 최대 연결 수로 변경
    }
  }

  lifecycle {
    ignore_changes = [
      settings[0].insights_config,
    ]
  }

  deletion_protection = false
}

# Cloud SQL for PostgreSQL 설정 - 프로덕션 환경
resource "google_sql_database_instance" "postgres_prd" {
  # Cloud SQL 인스턴스 이름을 지정합니다.
  name = var.db_instance_name_prd

  # PostgreSQL 데이터베이스 버전을 지정합니다.
  database_version = "POSTGRES_13"

  # 인스턴스가 위치할 지역을 지정합니다. (한국 지역: asia-northeast3)
  region = var.db_region

  # 인스턴스 설정
  settings {
    # 인스턴스의 머신 타입을 지정합니다.
    tier = var.db_tier

    # 백업 구성 설정
    backup_configuration {
      # 백업 기능을 비활성화합니다.
      enabled = false
    }

    # IP 구성 설정
    ip_configuration {
      # 승인된 네트워크를 설정합니다.
      authorized_networks {
        # 네트워크 이름을 지정합니다.
        name = var.authorized_network_name

        # 모든 IP 주소를 허용합니다. (보안상 실제 환경에서는 제한된 IP만 허용해야 합니다)
        value = var.authorized_network_value
      }
    }

    insights_config {
      query_insights_enabled  = false
      query_plans_per_minute  = 0
      query_string_length     = 1024
      record_application_tags = false
      record_client_address   = false
    }

    database_flags {
      name  = "max_connections"
      value = "100" # 원하는 최대 연결 수로 변경
    }
  }

  lifecycle {
    ignore_changes = [
      settings[0].insights_config,
    ]
  }


  deletion_protection = false
}

# 개발 환경용 데이터베이스 설정
resource "google_sql_database" "dev" {
  # 데이터베이스 이름을 지정합니다.
  name = var.db_instance_name_dev

  # 연결할 인스턴스를 지정합니다.
  instance = google_sql_database_instance.postgres_dev.name
}

# 프로덕션 환경용 데이터베이스 설정
resource "google_sql_database" "prd" {
  # 데이터베이스 이름을 지정합니다.
  name = var.db_instance_name_prd

  # 연결할 인스턴스를 지정합니다.
  instance = google_sql_database_instance.postgres_prd.name
}

# 기본 사용자 설정 - 개발 환경
resource "google_sql_user" "default_dev" {
  # 사용자 이름을 지정합니다.
  name = var.db_user_name_dev

  # 연결할 인스턴스를 지정합니다.
  instance = google_sql_database_instance.postgres_dev.name

  # 사용자의 비밀번호를 지정합니다.
  password = var.db_user_password_dev
}

# 기본 사용자 설정 - 프로덕션 환경
resource "google_sql_user" "default_prd" {
  # 사용자 이름을 지정합니다.
  name = var.db_user_name_prd

  # 연결할 인스턴스를 지정합니다.
  instance = google_sql_database_instance.postgres_prd.name

  # 사용자의 비밀번호를 지정합니다.
  password = var.db_user_password_prd
}
