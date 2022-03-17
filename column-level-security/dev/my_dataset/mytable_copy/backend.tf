terraform {
  backend "gcs" {
    bucket = "tf-backend-4321"
    prefix = "env/dev/my_dataset/mytable_copy"
  }
}