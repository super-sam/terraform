# Declaring a Number Variable
variable "mynum" {
    type = number
    default = 443
}


# Declaring String Variables
variable "myvar" {
    type = string
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


# Declaring Object Variable
variable "myobj" {
    type = object({
        a = number
        b = string
    })
    default = {
        a: 123,
        b: "abc"
    }
}
