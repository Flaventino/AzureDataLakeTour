# RESOURCES GROUP PROPERTIES
variable "ResourceGroupName" {
    type        = string
    description = "Name of the resources group"
}
variable "ResourceGroupLocation" {
    type        = string
    description = "Geographical location where the resources group will be created"
}

variable "DataLakeName" {
    type        = string
    description = "Name to give the datalake (which essentially is a special storage account)"
}

variable "BasicBlobStorageName" {
    type        = string
    description = "Name to give the basic blob storage (which essentially is a standard storage acount)"
}