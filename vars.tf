
variable "app_name" {
  type    = string
  default = "example-app"
}
variable "branch_name" {
  type    = string
  default = "main"
}


variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "repository_url" {
  type    = string
  default = "https://github.com/gtogbes/Amplify-Cognito-Custom-React"
}

variable "github_access_token" {
  type = string
  default = "your_access_token"
}
variable "build_spec" {
  type    = string
  default = <<EOF
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: build
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
EOF
}