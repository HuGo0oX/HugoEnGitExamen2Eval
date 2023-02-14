#!/bin/bash
ciudad=$1
media=`./cmedia.sh $ciudad`

if [ $media -lt 400 ]
then
    echo "La ciudad $ciudad obtiene la calificacion ECO."
else 
    echo "La ciudad $ciudad NO obtiene la calificacion ECO."
fi
