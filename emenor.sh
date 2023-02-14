#!/bin/bash
lin=$(cat consumos.txt | wc -l)
cat consumos.txt | tail -n+2 | awk '{print $1}' | sort -u > ciudades.txt
limit=$(cat ciudades.txt | wc -l)
min=100000
while [ $limit -ne 0 ]
do
    auxmin=$(./cmedia.sh $limit)
    if [ $auxmin -lt $min ]
    then
        min=$auxmin
        ciudadmin=$(cat ciudades.txt | tail -n+$limit | head -n1)
    fi
    limit=$((limit-1))
done
echo "La ciudad con el minimo consumo es $ciudadmin."