#!/bin/bash

if [ -z "$1" ]
then
    echo "Veuillez donner le fichier à analyser"
    exit 1
fi

fichier=$1

event=$( wc -l < $fichier )
echo "Nombre total d'évenements dans $fichier : $event"
echo ""

success=$( grep -c "success" $fichier )
echo "Nombre de connexion reussi: $success"
echo ""

echec=$( grep -c "failed" $fichier )
echo "Nombre de connexion échouées: $echec"
echo ""

if [ $echec -gt 3 ]
then
    echo "ALERTE"
else
    echo "RAS"
fi

