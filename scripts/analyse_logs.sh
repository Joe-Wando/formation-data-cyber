#!/bin/bash

# Vérifier qu'un fichier a été fourni
if [ -z "$1" ]
then
    echo "Erreur : donne-moi un fichier à analyser."
    echo "Usage : ./analyse_logs.sh fichier.log"
    exit 1
fi

#Fichier à analyser
fichier=$1

echo "=== RAPPORT D'ANALYSE DE $fichier ==="
echo ""

# Compter le nombre total de lignes (connexions enregistrées)
total=$(wc -l < $fichier)
echo "Nombre total d'événements : $total"

# Compter les connexions réussies
succes=$(grep -c "success" $fichier)
echo "Connexions réussies : $succes"

# Compter les connexions échouées
echecs=$(grep -c "failed" $fichier)
echo "Connexions échouées : $echecs"

echo ""

# Alerte si trop d'échecs (seuil : 5)
if [ $echecs -gt 5 ]
then
    echo " ALERTE : nombre d'échecs élevé ($echecs) — activité suspecte possible !"
else
    echo " Situation normale ($echecs échecs)"
fi