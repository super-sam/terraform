# Run Basic Terraform File Execution
Create a terraform file and Storing the variables

### Pre-Requisite
Terraform must be installed in your system

### Create Variables
``` main.tf ```

### RUN Terraform Console
```
terraform console
```
This is run the terraform console and load all the file inside the path

### Print String Variable
```
> var.myvar
Hello TerraForm
> "${var.myvar}"
Hello TerraForm
```

### Print Map Variable
```
> var.mymap
{
  "mykey" = "My Value"
}
> "${var.mymap}"
{
  "mykey" = "My Value"
}
```
### Print Map Variable Value with key
> var.mymap["mykey"]
"My Value"
> "${var.mymap["mykey"]}"
"My Value"

### Print List Variables
```
> var.mylist
[0, 1, 2]

> var.mylist[1]
1
```

### List Functions
```
element(var.myvar, 1)
1

slice(var.myvar, 0, 2)
```
