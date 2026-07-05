# Analyseur de logs de sécurité

Script bash qui analyse un fichier de logs et génère un rapport de sécurité.

## Utilisation
\`\`\`bash
./analyse_logs.sh fichier.log
\`\`\`

## Fonctionnalités
- Compte le nombre total d'événements
- Compte les connexions réussies et échouées
- Déclenche une alerte si le nombre d'échecs dépasse un seuil
- Fonctionne sur n'importe quel fichier de logs passé en argument

## Compétences utilisées
grep, pipes, wc, variables, conditions, arguments de script