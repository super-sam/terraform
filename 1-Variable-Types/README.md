
# Run Basic Terraform File Execution
Create a terraform file to store variables the variables. Get the value of the variables in the **_terraform console_**

## Pre-Requisite
Terraform must be installed in your system

## Create Variables
Check  ``` main.tf ``` for the variable declarations.
### Types of variables are :
- number : To store _Numeric_ values.
- string : To store _String_.
- list: To store an _Array_. 
- map: It can have _Key-Value_ pair of data.
- object: It can have a _JSON_ Object

## RUN Terraform Console
```terraform console```

This is _run_ the terraform console and _load_ all the _.tf_ file inside the current directory.

### Print Number Variable
```
> var.mynum
443

> "${var.mynum}"
443
```

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

```
> var.mymap["mykey"]
"My Value"

> "${var.mymap["mykey"]}"
"My Value"
```

### Print JSON Object values
```
> var.myobj.a
123

> "${var.myobj.b}"
abc
```

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
[0, 1]
```