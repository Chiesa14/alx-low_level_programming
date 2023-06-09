#!/bin/bash

# Collect all .c files in the current directory
c_files=$(ls *.c)

# Compile each .c file into object files
object_files=""
for file in $c_files; do
    gcc -c $file -o ${file%.c}.o
    object_files+=" ${file%.c}.o"
done

# Create the static library
ar rcs liball.a $object_files

# Cleanup: Remove the object files
rm -f $object_files

echo "Static library liball.a created successfully."
