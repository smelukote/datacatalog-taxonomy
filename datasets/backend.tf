terraform {
  backend "gcs" {
    bucket = "tf-backend-4321"
    prefix = "env/dev/datasets"
  }
}