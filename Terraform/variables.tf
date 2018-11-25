variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "us-east-1"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 3000
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "ecs_autoscale_role" {
  description = "Role arn for the ecsAutocaleRole"
  default     = "arn:aws:iam::091579642560:role/ecsAutoscaleRole"
}

variable "cluster_id" {
  description = "Id to assign the new cluster"
}

variable "ecs_task_execution_role" {
  description = "Role arn for the ecsTaskExecutionRole"
  default     = "arn:aws:iam::091579642560:role/ecsTaskExecutionRole"
}

variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "environment" {
  default     = "sentryterraform"
  description = "The environment"
}

variable "allocated_storage" {
  description = "Allocated storage to RDS DB"
  default     = "2048"
}

variable "instance_class" {
  description = "RDS instance Class"
  default     = "db.t2.micro"
}

variable "multi_az" {
  default     = false
  description = "Muti-az allowed?"
}

variable "postgres_database_name" {
  description = "Postgres database name"
  default     = "2048"
}

variable "elasticache_database_name" {
  description = "Elasticache database name"
  default     = "2048"
}

variable "database_username" {
  description = "Database username"
  default     = "rdsadminuser"
}

variable "database_password" {
  description = "Database passowrd"
  default     = "rdsadminpassword"
}

variable "route53_zone_id" {
  description = "Hosted Zone Id of created hosted Zone anmolposts.com"
  default     = "Z2R3027KZILICR"
}



