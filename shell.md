# Shell

### Hello, World!

- **Bash**: Bourne Again Shell
- `#!/bin/sh`: direct the .sh script to the interpreter location

### Variables

Initialization, no space on either side of =

```shell
PRICE=5
name=Joy
greetings="Hello, World!"
```

Use `$` to subsititue var. Sometimes, encapsulate the var with `${}` to avoid ambiguity

```shell
echo $name,  	# Joy
echo $name2  	# (no output, since no name2 var was assigned)
echo ${name}2	# Joy2
echo "$name"2	# Joy2
```

Assign var with the output of the command with `` or with $().

```shell
FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
```



### Parse script arguments

```shell
./somescript.sh apple 5 banana 8 "Fruit Basket" 15
echo $3  # results with: banana
BIG=$5
echo $#  # results with: 6(number of arguments)
```



### Arrays

Initialization: use space-delimited values in (); need not be consecutive.

```shell
my_array=(apple banana "Fruit Basket" orange)
new_array[2]=apricot
```

Total number, access by index

```bash
echo ${#my_array[@]} 	# results with: 4
echo ${my_array[2]}		# results with: Fruit Basket
```

Refer to all values

```shell
for x in ${a[@]}; do
	echo ${x}
done
```



### Basic operator

Arithmetic expression: $(())

```shell
A=3
B=$((100 * $A + 5))
```



### String

Length

```shell
STRING="abcdefg"
echo ${#STRING}
```

Find position, with `expr index`

```shell
STRING='Hello, World!'
COMMA=`expr index STRING ","`		# position 5 of first comma
```

Substring extraction

```shell
echo ${STRING:1:3}   # results with: bcd
```

Substring replacement

```shell
STRING="to be or not to be"
echo ${STRING[@]/be/eat}        # to eat or not to be
echo ${STRING[@]//be/eat}        # to eat or not to eat
echo ${STRING[@]// not/}        # to be or to be
echo ${STRING[@]/#to be/eat now}    # eat now or not to be
echo ${STRING[@]/%be/eat}        # to be or not to eat
echo ${STRING[@]/%be/be on $(date +%Y-%m-%d)}    # to be or not to be on 2012-06-14
```



### Control flow

White spaces are required.

If equal  =, not ==.

```shell
NAME="George"
if [ "$NAME" = "John" ]; then
  echo "John Lennon"
elif [ "$NAME" = "George" ]; then
  echo "George Harrison"
else
  echo "This leaves us with Paul and Ringo"
fi
```

Case structure

```shell
case "$variable" in
    "$condition1") command ;;
    "$condition2") command ;;
esac
```

For loop

```shell
NAMES=(Joe Jenny Sara Tony)
for N in "${NAMES[@]}" ; do
  echo "My name is $N"
done
```

While loop

```shell
COUNT=4
while [ $COUNT -gt 0 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done
```

Until loop

```shell
COUNT=1
until [ $COUNT -gt 5 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT + 1))
done
```

break and continue also work.



### Functions

```shell
function adder {
  echo "$(($1 + $2))"
}

# FUNCTION CALLS
# Pass two parameters to function adder
adder 12 56                  # 68
```



### Special variables

- `$0` - The filename of the current script.|
- `$n` - The Nth argument passed to script was invoked or function was called.|
- `$#` - The number of argument passed to script or function.|
- `$@` - All arguments passed to script or function.|
- `$*` - All arguments passed to script or function.|
- `$?` - The exit status of the last command executed.|
- `$$` - The process ID of the current shell. For shell scripts, this is the process ID under which they are executing.|
- `$!` - The process number of the last background command.|





















