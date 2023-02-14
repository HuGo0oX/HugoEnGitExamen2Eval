#!/bin/bash

lin=`cat consumos.txt | wc -l`
ciudad=$1
sumatorio=0
media=0
cont=0

for i in `seq 2 $lin`
do
ciudadaux=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
consumo=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'`
    if [ $ciudad == $ciudadaux ]
    then
        suma=$((suma+consumo))
        cont=$((cont+1))
    fi
done
media=$((suma/cont))
echo "La media de consumo de $ciudad es de $media."
