#!/bin/bash

printf "Start of Run\n" >> success.txt

start=$(date +%s)

words=$(awk '{print $1}' /home/alec/Documents/ceg3400/lab01/miner/wordlist) # word list downloaded from https://www.mit.edu/~ecprice/wordlist.10000
counter=0;

while [ $counter -lt 1 ];
do
	for word in $words;
	do
		nonce=$(echo $((RANDOM+10)))
		hashed=$(cut -c 1-64 <<< $(printf $nonce$word | sha256sum))

		if [[ "$hashed" =~ ^0000 ]]; then
			printf "$nonce$word = $hashed\n" >> success.txt
			printf "Hash Found: $nonce$word = $hashed\n"
			counter=$((counter+1))
		elif [[ "$hashed" =~ ^00000 ]]; then
			printf "$nonce$word = $hashed\n" >> success.txt
			printf "Hash Found: $nonce$word = $hashed\n"
			counter=$((counter+1))	
		fi
	done	
done

end=$(date +%s)
printf "Elapsed Time: $(($end-$start)) seconds.\n" 
printf "End of Run Elapsed Time:  $(($end-$start)) seconds.\n\n\n" >> success.txt

