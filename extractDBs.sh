#!/usr/bin/env bash

if [[ ! -f shodan_data.json ]] ; then
    echo 'File shodan_data.json not found.'
    exit
fi

~/jq-linux64 -r '.ip_str as $ip | {data:.data} | { data: (.data | fromjson[2])} | .data.databases[] | {name: .name, sizeOnDisk: .sizeOnDisk} | [$ip, .name, .sizeOnDisk]  | @csv' shodan_data.json > databases.csv

sed -i -e '1iip,dbname,dbsize\' databases.csv
