#!/bin/bash
# FUNCTION: Ping urls in sitemaps and get their status codes if greater than 300.
# ARGUMENTS: /
# REQUIRES: curl, xmlstarlet

echo ...

#### Input

sitemaps=(https://jeremylanssiers.com/sitempap.xml)

#### Output

output_directory="./output/"
urls="$output_directory""sitemap-urls.txt"
errors="$output_directory""sitemap-urls-errors.txt"
rm "$urls" "$errors" 2> /dev/null

# output a list of all urls in the sitemap

for sitemap in "${sitemaps[@]}"
do 
    sitemap=$(curl -s $sitemap | xml format -n)
    
    while ifs= read -r line
    do
        if [[ "$line" =~ "https" ]]; then 
            echo "$line" | sed -E s'/(\<loc\>|\<\/loc\>)//'g >> "$urls"
        fi
    done <<< "$sitemap"
done

# Test all urls in the sitemap and throw an error if the status is not a success or not a redirect

while ifs= read -r line
do
    status=$(curl -Is -o /dev/null -w "%{http_code}" "$line")
    if [[ $status -gt 4300 ]]; then echo $line : $status; echo $line : $status >> "$errors"; fi
done <<< $(cat "$urls")

echo done
exit 0