#!/usr/bin/env bash

if [[ ! -f neo4j-shell ]] ; then
    echo 'Neo4j Shell File not found. Execute within Neo4j Bin Directory'
    exit
fi

sh neo4j-shell -c "export-graphml -t -o out.graphml MATCH ()-[r]->() RETURN r"

iconv -f utf8 -t ascii//TRANSLIT < out.graphml > out_clean.graphml