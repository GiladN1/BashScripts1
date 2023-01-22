#!/bin/bash
read -p "Enter your email: " email
valid=`echo $email | grep "\w\+@\w\+\.\w\+"`
echo $valid
if [[ $email = $valid ]]
then
	echo "$email is a valid email address"
else
	echo "$email is not a valid email address"
fi
