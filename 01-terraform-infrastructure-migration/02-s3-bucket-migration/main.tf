# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "zenithra-prod-buck"
resource "aws_s3_bucket" "main" {
  bucket              = "zenithra-prod-buck"
  bucket_namespace    = "global"
  bucket_prefix       = null
  force_destroy       = false
  object_lock_enabled = false
  region              = "ap-south-1"
  tags                = {}
  tags_all            = {}
}
