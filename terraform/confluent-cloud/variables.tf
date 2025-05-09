variable "confluent_cloud_api_key" {
  description = "Confluent Cloud API Key (also referred as Cloud API ID)"
  type        = string
  sensitive   = true
}

variable "confluent_cloud_api_secret" {
  description = "Confluent Cloud API Secret"
  type        = string
  sensitive   = true
}

variable "aws_kms_key_arn" {
  description = "Key ID (ARN) of AWS KMS (for example, arn:aws:kms:us-east-1:123456789012:key/12345678-1234-1234-1234-123456789abc)"
  type        = string
  sensitive   = true
}
