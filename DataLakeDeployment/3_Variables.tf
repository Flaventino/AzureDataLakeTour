# RESOURCES GROUP PROPERTIES
variable "ResourceGroupName" {
    type        = string
    description = "Name of the resources group"
}
variable "ResourceGroupLocation" {
    type        = string
    description = "Geographical location where the resources group will be created"
}

variable "StorageAccountName" {
    type        = string
    description = "Name to give the datalake"
}