#!/bin/bash
function help ()  {
	echo "To use this script, launch getopts.sh with at least one of the following arguments:"
	echo "-c to clear screen, -d to list files in current directory, -m to launch mc and -e coupled with your desired text editor to launch it"
	echo "examples: getopts.sh -c -clear the screen, getopts.sh -e vim - launch vim"
}
if [ $# -lt 1 ]
then
	help
fi
while getopts cdme: arg; do
case $arg in
	c)
		clear
		;;
	d)
		ls -l "`pwd`"
		;;
	m)
		mc
		;;
	e)
		$OPTARG
		;;
	*)
		help
		;;	
esac
done 2>/dev/null
