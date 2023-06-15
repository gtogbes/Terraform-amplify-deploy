
resource "aws_amplify_app" "example" {
  name         = var.app_name
  repository   = var.repository_url
  access_token = var.github_access_token
  build_spec  = var.build_spec
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    ENV = "test"
  }
  auto_branch_creation_patterns = [
    "*",
    "*/**",
  ]

  auto_branch_creation_config {
    # Enable auto build for the created branch.
    enable_auto_build = true
  }
  
  

}

resource "aws_amplify_branch" "example" {
  app_id      = aws_amplify_app.example.id
  branch_name = var.branch_name
}
resource "aws_amplify_backend_environment" "example" {
  app_id           = aws_amplify_app.example.id
  environment_name = "example"

  deployment_artifacts = "app-example-deployment"
  stack_name           = "amplify-app-example"
}
resource "aws_amplify_webhook" "main" {
  app_id      = aws_amplify_app.example.id
  branch_name = aws_amplify_branch.example.branch_name
  description = "triggermain"
}
