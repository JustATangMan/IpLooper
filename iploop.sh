#!/bin/bash 

echo "IpLooper Program -------------------"
rm ./countries.txt
rm ./results.txt
rm ./hold.json

for i in $(cat ./ips.txt)
do
	
	object=$(curl http://ip-api.com/json/"$i")
	echo $object > hold.json
	echo -e "$object\n" >> results.txt
	country=$(jq .country hold.json | sed 's/"//g')
	echo -e "matched country: $country"
	if [ "$country" == "United States" ]; then
		echo -e "The IP address $i is in America \n" >> countries.txt
	else
		echo -e "The IP address $i is not in America \n" >> countries.txt
	fi
done
