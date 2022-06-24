jq --slurp . < $1 > tmp.json
jq 'walk(if type == "object" then with_entries( if .key == "full_text" then .key = "text" else . end ) else . end)' tmp.json > $2
rm tmp.json