#!/bin/bash
# FUNCTION: Compare urls from previously downloaded sitemaps to the current sitemap and print an error if lastmod element is more recent in the old sitemap.
# ARGUMENTS: /
# REQUIRES: curl, xmlstarlet

# --- Global variables

languages=(nl fr de)

# --- Input

input_dir="./input/"
old_sitemaps_dir="$input_dir""old-sitemaps/"
new_sitemaps_dir="$input_dir""new-sitemaps/"
output_dir="./output/"

old_sitemaps=("$old_sitemaps_dir"nl.xml "$old_sitemaps_dir"fr.xml "$old_sitemaps_dir"de.xml)
new_sitemaps_urls=(https://www.jeremylanssiers.com/sitemap.xml)
new_sitemaps=()
#new_sitemaps=("$new_sitemaps_dir"nl.xml "$new_sitemaps_dir"fr.xml "$new_sitemaps_dir"de.xml)

# ---- Output

errors_file="$output_dir"comparison-errors.txt
rm -f "$errors_file"

index=0

for sitemap in "${new_sitemaps_urls[@]}"
do
    xml=$(echo "$new_sitemaps_dir"${languages["$index"]}.xml)
    echo $(curl --silent "$sitemap") > "$xml"
    new_sitemaps+=("$xml")#
    index=$((index+1))
done

index=0
error_index=0

echo testing: ${languages["$index"]} sitemap

for sitemap in "${old_sitemaps[@]}"
do 
    while ifs= read -r oldline
    do
        url=$(echo -ne "$oldline" | sed -E s'/(\t|([0-9]{4}-[0-9]{2}-[0-9]{2}))//'g)
        lastmod=$(echo -ne "$oldline" | sed -E s'/(\t|(^(.*.)html))//'g)

        while ifs= read -r newline
        do
            new_url=$(echo -ne "$newline" | sed -E s'/(\t|([0-9]{4}-[0-9]{2}-[0-9]{2}))//'g)
            new_lastmod=$(echo -ne " $newline" | sed -E s'/(\t|(^(.*.)html))//'g)

            if [[ "$url" == "$new_url" ]];
            then 
                if [[ "$lastmod" -lt "$new_lastmod" ]]; 
                then
                    echo -e "$url" - last modified: "$lastmod""\n"has regressed "$new_url" - lastmodified: "$new_lastmod""\n\n" >> "$errors_file"
                    error_index=$((error_index+1))
                fi
            fi

        done <<< "$(xml sel -t -m "//_:url" -v . -n ${new_sitemaps["$index"]})"
    done <<< "$(xml sel -t -m "//_:url" -v . -n "$sitemap")"

    index=$((index+1))
done

if [[ "$index" -gt 1 ]]; then echo discrepancies detected: "$error_index"; fi

echo done
exit 0