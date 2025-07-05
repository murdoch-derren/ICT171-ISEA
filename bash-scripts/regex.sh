log_line='111.111.111.111 - - [29/Jun/2025:16:24:00 +0800] "GET /api/v1 HTTP/2.0" 200 408 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36"' 

regex='^([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+) ([^ ]+) ([^ ]+) \[([^]]+)\] \"([A-Z]+) ([^\"]+) (HTTP\/[0-9.]+)\" ([0-9]{3}) ([0-9]+) \"([^\"]*)\" \"(.*)\"$' 

if [[ $log_line =~ $regex ]]; then 
	echo "IP: ${BASH_REMATCH[1]}" 
	echo "Remote User: ${BASH_REMATCH[3]}" 
	echo "Timestamp: ${BASH_REMATCH[4]}" 
	echo "HTTP Method: ${BASH_REMATCH[5]}" 
	echo "Path: ${BASH_REMATCH[6]}" 
	echo "HTTP Version: ${BASH_REMATCH[7]}" 
	echo "HTTP Response: ${BASH_REMATCH[8]}" 
	echo "Bytes: ${BASH_REMATCH[9]}" 
	echo "Referrer: ${BASH_REMATCH[10]}" 
	echo "User Agent: ${BASH_REMATCH[11]}" 
else 
	echo "No match..." 
fi
