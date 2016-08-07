#!/usr/bin/env bash
if [[ ! -f shodan_data.json ]] ; then
    echo 'File shodan_data.json not found.'
    exit
fi

~/jq-linux64 -r '. | {ip: .ip_str, port: .port, org: .org, location: .location, data: (.data | fromjson[2])} | [.ip, .port, .location.city, .location.country_code, .location.longitude, .location.latitude, .data.totalSize, .org] | @csv' shodan_data.json > servers.csv
