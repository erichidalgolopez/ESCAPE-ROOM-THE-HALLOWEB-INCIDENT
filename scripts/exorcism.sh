#!/bin/bash

CSV="data/ghost_hosts.csv"

PORTS_CRITICS="22 443"

echo "FORENSIC SOFTWARE"
echo "Analitzant equips..."

if [ ! -f "$CSV" ]; then
    echo "Error: no s'ha trobat el CSV"
    exit 1
fi

while IFS=, read -r hostname ip estat port; do

    if [ "$hostname" = "Hostname" ]; then
        continue
    fi

    if [[ " $PORTS_CRITICS " == *" $port "* ]]; then
        echo "PORT CRITIC: $hostname - $port"
    else
        echo "DESCARTAT: $hostname - $port"
    fi

done < "$CSV"

echo "Analisi finalitzada"