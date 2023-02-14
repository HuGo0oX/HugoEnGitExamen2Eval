#!/bin/bash
lin=`cat consumos.txt | wc -l`
for i in `seq 2 $lin`
do
ciudad=`cat consumos.txt | tail -n+1 | awk '{print $1}' | uniq >> ciudades.txt`
break
done
limit=`cat ciudades.txt | wc -l`
min=100000
for i in `seq 2 $limit`
do
    while [ $limit -ne 0 ]
    do
    auxmin=`./cmedia.sh $i`
    if [ $auxmin -lt min ]
    then
        min=$auxmin
        ciudadmin=`cat ciudades.txt | tail -n+$i | head -n1`
    fi
    limit=$((limit-1))
    done
done
echo "La ciudad con el minimo consumo es $ciudadmin."