# IpLooper
A simple practice program using Bash scripting, cURL, sed, and jq (command-line JSON processing tool).

# Technologies Used
* Bash (Linux)
   * cURL
   * jq
   * sed
* https://ip-api.com/docs/api:json (IP -> JSON API)
* https://www.ipvoid.com/random-ip/ (IP address generator)

# Functionality
* Reads a text file of IP addresses (hardcoded, generated from ipvoid.com)
* Passes addresses to ip-api, which returns a JSON file containing information (e.g. country, longitude, latitude, etc.)
  
![image](https://github.com/JustATangMan/IpLooper/assets/45743962/161bafbd-1a23-46b3-827c-f81d2b3ccce6)
  
* Filters out the "country" field from the JSON to determine if the IP address is located in the United States or not
  
![image](https://github.com/JustATangMan/IpLooper/assets/45743962/831bb953-d8f9-4a7e-86ec-80df9834cd0a)
  
# Notes
During development, I encountered an interesting bug/error. jq offers an option, -C, which "colorizes" the JSON when printed. I used this option when filtering for 
the "country" field of the JSON file, comparing it to "United States" in my Bash script.
Although they were the same word, the comparison returned false. After experimenting the the -C option and converting the "country" field to hex, I concluded the -C 
option changes strings beyond their basic letter appearance. The following image illustrates this:
  
![image](https://github.com/JustATangMan/IpLooper/assets/45743962/7bcfce7f-434f-49c3-a225-1218de0d1ef9)
  
The red underlined variables are the string "fail", extracted from the JSON via jq (without -C option); when compared with the string "fail" 
(the blue underlined variables), the comparison was true, and their hex values/translations were also equal.
The green underlined variables are also the string "fail", but this time with jq's -C option. The hex value is much different from the "fail" literal, hence the 
comparison between the two failed. 
Something to look out for/research more.
