
output "bucket_name" {
    description = "Bucket name for our static website hosting"
    value = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
  description = "s3 static Website endpoint"
  value = module.terrahouse_aws.website_endpoint
}