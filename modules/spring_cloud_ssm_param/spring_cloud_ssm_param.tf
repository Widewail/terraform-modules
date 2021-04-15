variable "value" {
  type = string
}
variable "env" {
  type = string
}
variable "key" {
  type = string
}
variable "app" {
  type = string
}
variable "type" {
  type = string
  validation {
    condition = contains([
      "String",
      "StringList",
      "SecureString"], var.type)
    error_message = "Allowed values for type are \"String\", \"StringList\", or \"SecureString\"."
  }
}
variable "tags" {
  type = map(string)
}

resource "aws_ssm_parameter" "param" {
  name = "/config/${var.app}_${var.env}/${var.key}"
  type = var.type
  value = var.value
  tags = var.tags
}
