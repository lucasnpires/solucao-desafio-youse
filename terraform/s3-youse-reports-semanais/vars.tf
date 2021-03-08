variable "access_key" {}

variable "secret_key" {}

variable "region" {
    default = "us-east-1"
}

variable "s3" {
    default = {    
        create_bucket          = true        
        name                   = "youse-reports-semanais"
        acl                    = "private"        

        versioning = {
            enabled = true
        }

        cors_rule = [
        {
            allowed_methods = ["PUT", "POST"]
            allowed_origins = ["https://modules.tf", "https://terraform-aws-modules.modules.tf"]
            allowed_headers = ["*"]
            expose_headers  = ["ETag"]
            max_age_seconds = 3000
            }, {
            allowed_methods = ["PUT"]
            allowed_origins = ["https://example.com"]
            allowed_headers = ["*"]
            expose_headers  = ["ETag"]
            max_age_seconds = 3000
        }]

        lifecycle_rule = [
        {
            id      = "log"
            enabled = true
            prefix  = "log/"

            tags = {
            rule      = "log"
            autoclean = "true"
            }

            transition = [
            {
                days          = 30
                storage_class = "ONEZONE_IA"
                }, {
                days          = 60
                storage_class = "GLACIER"
            }
            ]

            expiration = {
            days = 90
            }

            noncurrent_version_expiration = {
            days = 30
            }
        },
        {
            id                                     = "log1"
            enabled                                = true
            prefix                                 = "log1/"
            abort_incomplete_multipart_upload_days = 7

            noncurrent_version_transition = [
            {
                days          = 30
                storage_class = "STANDARD_IA"
            },
            {
                days          = 60
                storage_class = "ONEZONE_IA"
            },
            {
                days          = 90
                storage_class = "GLACIER"
            },
            ]

            noncurrent_version_expiration = {
            days = 300
            }
        }]
    }
}

variable "tags" {
    default = {
        "Billing"      = "Youse-Reports"
        "Environment"  = "Production"   
    }
}