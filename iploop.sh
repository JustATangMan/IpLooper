#!/bin/bash 

echo "test"
rm ./countries.txt
rm ./results.txt
rm ./hold.json

for i in $(cat ./ips.txt)
do
	
	object=$(curl http://ip-api.com/json/"$i")
	echo $object > hold.json
	echo -e "$object\n" >> results.txt
	country=$(jq -C .country hold.json | sed 's/"//g')
	echo -e "matched country: $country"
	if [ "$country" == "United States" ]; then
		echo "The IP address $i is in America" >> countries.txt
		echo "" >> countries.txt
	else
		echo "The IP address $i is not in America" >> countries.txt
		echo "" >> countries.txt
	fi
done
