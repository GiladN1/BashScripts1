#!/bin/bash
read -p "Enter a directory name: " folder
if [ -d $folder ];
then
	folder2=$folder"-$(date +"%d-%m-%y.backup")"
	folder3=`find $folder*.backup -type d 2>/dev/null`
        echo $folder3	
	if [ ! -d "$folder3" ];
	then
		cp -vr $folder $folder2
		for file in "$folder2"/*;
                do
              		mv "$file" "$file"-$(date +"%d-%m-%y.backup")""
                done
	else
		if test `find "$folder3" -type d -mmin +2880`;
		then
			read -p  "Backup folder is older than 48 hours, Do you want to replace it?" ans
		else
			read -p  "Backup folder isn't older than 48 hours, Do you want to replace it?" ans
		fi
		if [ $ans = "yes" ];
		then
			rm -r $folder3
			cp -vr $folder $folder2
			for file in "$folder2"/*;
                	do
                        	mv "$file" "$file"-$(date +"%d-%m-%y.backup")""
                	done

		else
			echo "Backup folder wasn't replaced"
		fi
	fi
else
	echo "Folder doesn't exist"
fi       
