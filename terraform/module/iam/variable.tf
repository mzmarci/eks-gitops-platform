###################################################
# Project Name
###################################################

variable "project_name" {

  description = "Project name"

  type = string

}

###################################################
# Environment
###################################################

variable "environment" {

  description = "Deployment environment"

  type = string

}

variable "tags" {

  description = "Common resource tags"

  type = map(string)

  default = {}

}