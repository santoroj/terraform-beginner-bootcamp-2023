variable "user_uuid" {
  description = "UUID of the user"
  type        = string

  validation {
    condition     = can(regex("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$", var.user_uuid))
    error_message = "Invalid UUID format. Please provide a valid UUID."
  }
}

variable "bucket_name" {
  description = "s3 bucket name"
  type        = string

  validation {
    condition = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    )
    error_message = "The bucket name must be between 3 and 63 characters"
  }
}

variable "index_html_filepath" {
  description = "Path to the index.html file"
  type        = string

  validation {
    condition     = can(file(var.index_html_filepath))
    error_message = "The specified path does not exist or is not a valid file."
  }
}

variable "error_html_filepath" {
  description = "Path to the error.html file"
  type        = string

  validation {
    condition     = can(file(var.error_html_filepath))
    error_message = "The specified path does not exist or is not a valid file."
  }
}


variable "content_version" {
  type        = number
  description = "The version of the content (positive integer starting at 1)"
  
  validation {
    condition     = var.content_version > 0 && can(var.content_version) == true
    error_message = "Content version must be a positive integer starting at 1."
  }
}