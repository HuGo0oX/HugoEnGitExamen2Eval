#!/bin/bash

lineas=`cat consumos.txt | wc -l`
ciudad=""
ciudadaux=""
consumo=0
aux=0
while [ $aux -eq 0 ];
do
    echo "Introduce una ciudad: "
    read ciudad
    for i in `seq 2 $lineas`
    do
    ciudadaux=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
    consumoaux=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'`
        if [ $ciudad == $ciudadaux ]
        then
        consumo=$(($consumo + $consumoaux))
        aux=1
        fi
    done
done
echo "El consumo total de $ciudad es de: $consumo"
