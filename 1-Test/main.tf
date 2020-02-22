# Declaring String Variables
variable "myvar" {
    type = "string"
    default = "Hello TerraForm"
}
# Declaring Map|Dict Variables
variable "mymap" {
    type = map(string)
    default = {
        mykey = "My Value" 
    }
}

# Declaring List Variables
variable "mylist" {
    type = list
    default = [1, 2, 3]
}
