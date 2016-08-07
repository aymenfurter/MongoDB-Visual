#!/usr/bin/env bash

if [[ ! -f shodan_data.json ]] ; then
    echo 'File shodan_data.json not found.'
    exit
fi

sed -i 's/MongoDB Server Information/[/g' shodan_data.json
sed -i 's/},\\n",/}]",/g' shodan_data.json
