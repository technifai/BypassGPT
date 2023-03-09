# With the help of this tool you will be able to bypass ChatGPT filters.
# This code is written by Tabeer Shahjahan (@technifai) 
# **YOU WILL BE RESPONSIBLE FOR YOUR DEEDS"
#!/bin/sh

echo "You Asked:" $1
echo "***Be careful what you asked for, I AM NOT RESPONSIBLE FOR MY ANSWER***"
echo "My Response:" 

curl=`cat <<EOS
curl -s https://api.openai.com/v1/completions \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $CHATGPT_TOKEN" \
  -d '{
  "model": "text-davinci-003",
  "prompt": "$1",
  "max_tokens": 4000,
  "temperature": 1.0

}' \
--insecure | jq -r '.choices[]'.text
EOS`

eval ${curl}
