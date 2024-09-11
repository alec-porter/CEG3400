#!/bin/bash

# list the number of unique users
uniqueUsers=$(awk -F, 'NR>1 {print $1}' /home/alec/Documents/ceg3400/lab01/data/quiz_data.csv | sort | uniq | wc -l)
printf "The number of unique users is $uniqueUsers\n"

# create list of unique users
listOfUsers=$(awk -F, 'NR>1 {print $1}' /home/alec/Documents/ceg3400/lab01/data/quiz_data.csv | sort | uniq)
printf "The users are:\n$listOfUsers\n"
printf "\n"

printf "Generated Data for Lab 1:\n"

# generate unique salt for each user, creat hashes,  and write new file with salt/hash value
saltedNames=()
count=1;
for userName in $listOfUsers;
do
	salt=$(echo $RANDOM | md5sum | head -c 5)  # generate random number, hash it, and keep first 5 characters to create salt
	hashed=$(cut -c 1-64 <<< $(printf $salt$userName | sha256sum))  # generate hash based on salt and username while removing spaces and - at the end of the hash
	saltHashValue=$salt$hashed # append salt with hash
	printf "User $count: $userName, Salt: $salt, Hash: $hashed, Salt + Hash: $saltHashValue, Salt + Hash Length: ${#saltHashValue}\n"
	sed -i "s/$userName/$saltHashValue/g" quiz_data.csv # replace user with salt+hash
	
	#saltedNames[count]="$salt$userName" # array with salted names and hashes

	count=$((count+1))
done
	


#echo ${saltedNames[0]} # array output
