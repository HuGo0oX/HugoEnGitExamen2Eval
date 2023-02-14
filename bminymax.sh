#!/bin/bash

lin=`cat consumos.txt | wc -l`
min=100000
max=0

for i in `seq 2 $lin`
do
    cons=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $4}'`
    if [ $cons -lt $min ]
    then
        min=$cons
        cmin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
        amin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $3}'`
        mmin=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $2}'`
    fi
    if [ $cons -gt $max ]
    then
        max=$cons 
        cmax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $1}'`
        amax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $3}'`
        mmax=`cat consumos.txt | tail -n+$i | head -n1 | awk '{print $2}'`
    fi
done
echo "Cidudad con el consumo máximo: $cmax en $mmax del $amax."
echo "Ciudad con el consumo mínimo: $cmin en $mmin del $amax."