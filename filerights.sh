#!/bin/bash

#reading data from the user
read -p 'Enter file name : ' FileName

if [ -e $FileName ]
then
	echo The file $FileName exists
else
	echo The file $FileName does not exist
fi

if [ -e $FileName ]
then
    # To view file permission for all users
    echo -n "The permission of $FileName is "
    ls -l $FileName | cut -c1-10

    # The user owner file permission
    echo -n "The user owner of this file $FileName has these rights " 
    ls -l $FileName  | cut -c2-4
    
    # The group owner file permission
    echo -n "The group owner of this file $FileName has these rights " 
    ls -l $FileName  | cut -c5-7
    # to remove write and execute permission group user of file
    chmod g-wx "${FileName}"

    echo -n "The group owner of this file $FileName has these rights after change of permission " 
    ls -l $FileName  | cut -c5-7

    # The other user file permission
    echo -n "The other user of this file $FileName has these rights " 
    ls -l $FileName  | cut -c8-10

    # to remove execute permission other user of file
    chmod o-x "${FileName}"

    echo -n "The group owner of this file $FileName has these rights after change of permission " 
    ls -l $FileName  | cut -c8-10

    # To view file permission in octal notation
    echo -n "The permission of $FileName in octal notation "
    stat -c "%a %n" $FileName

    # to set read, write, execute permission for user owner
    # to set write only for group user and other user of file
    chmod 722 "${FileName}"

    # To view file permission for all users after permission modifications
    echo -n "The permission of $FileName is "
    ls -l $FileName | cut -c1-10
fi