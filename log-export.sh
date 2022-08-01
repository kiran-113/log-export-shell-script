#!/bin/bash
read -p "Enter Source Directory Full Path to Find Log Files:" path
cd $path
find . -name "*.log"  -print | zip log-export.zip -@
read -p "Enter Destination Directory Full Path :" dir
mkdir $dir
mv $path/log-export.zip $dir
read -p "Do You Want to Unzip: " unzip
if [ "yes" == "$unzip" ]
then
read -p "Do You Want to Unzip to Same Folder?:" ifelse
if [ "yes" ==  "$ifelse" ]
then
cd $dir
unzip log-export.zip 
else
read -p "Enter Path Of Directory To Extract Files: " dir1
mkdir $dir1
cd $dir
unzip log-export.zip -d $dir1  
fi
fi