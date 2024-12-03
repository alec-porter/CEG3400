#!/bin/bash

# user list
totalUsers=$(awk -F, 'NR>1 {print $1}' /home/alec/Documents/ceg3400/lab01/data/quiz_data.csv)

printf "Generated Data for Lab 1:\n"

# generate unique salt for each user, creat hashes,  and write new file with salt/hash value
saltedNames=()
count=2;
for userName in $totalUsers;
do
	salt=$(echo $RANDOM | md5sum | head -c 5)  # generate random number, hash it, and keep first 5 characters to create salt
	hashed=$(cut -c 1-64 <<< $(printf $salt$userName | sha256sum))  # generate hash based on salt and username while removing spaces and - at the end of the hash
	saltHashValue=$salt$hashed # append salt with hash
	printf "User $count: $userName, Salt: $salt, Hash: $hashed, Salt + Hash: $saltHashValue, Salt + Hash Length: ${#saltHashValue}\n"
	sed -i "${count}s/$userName/$saltHashValue/" quiz_data.csv # replace user with salt+hash
	count=$((count+1))
done
