# Mémo des commandes — Formation Data & Cyber

Fichier récap de toutes les commandes vues. Enrichi au fur et à mesure.

## Navigation
- `pwd` : affiche le dossier courant (où je suis)
- `ls` : liste le contenu du dossier
- `ls -l` : liste en format détaillé (permissions, taille, date)
- `ls -la` : idem + fichiers cachés (qui commencent par `.`)
- `cd dossier` : entrer dans un dossier
- `cd ..` : remonter d'un niveau
- `cd ~` : aller dans mon dossier personnel
- Touche `Tab` : autocomplétion (à utiliser tout le temps !)

## Manipulation de fichiers et dossiers
- `mkdir nom` : créer un dossier
- `touch fichier` : créer un fichier vide
- `cp source destination` : copier
- `mv source destination` : déplacer ou renommer
- `rm fichier` : supprimer (DÉFINITIF, pas de corbeille)

## Écrire dans un fichier
- `echo "texte" > fichier` : écrit dans le fichier (ÉCRASE le contenu)
- `echo "texte" >> fichier` : AJOUTE à la fin du fichier
- `cat > fichier << 'EOF'` : écrire plusieurs lignes d'un coup (finir par EOF)

## Lire un fichier
- `cat fichier` : affiche tout le contenu
- `head -n 3 fichier` : affiche les 3 premières lignes
- `tail -n 3 fichier` : affiche les 3 dernières lignes

## Rechercher et filtrer
- `grep "motif" fichier` : affiche les lignes contenant le motif
- `grep -i "motif" fichier` : insensible à la casse (majuscules/minuscules)
- `grep -c "motif" fichier` : compte les lignes qui matchent
- `grep -v "motif" fichier` : affiche les lignes qui NE contiennent PAS le motif

## Compter, trier, dédoublonner
- `wc -l fichier` : compte les lignes
- `wc -w fichier` : compte les mots
- `sort fichier` : trie les lignes (alphabétique)
- `uniq fichier` : supprime les doublons CONSÉCUTIFS
- `uniq -c fichier` : compte les occurrences (à combiner avec sort)

## Le pipe `|`
- `commande1 | commande2` : envoie le résultat de la 1ère à la 2ème
- Exemple : `grep "failed" log | wc -l` : compte les lignes "failed"
- Exemple : `sort fichier | uniq -c` : compte proprement les occurrences

## Permissions
- `ls -l` : voir les permissions (ex: `-rw-r--r--`)
- Lecture : 1er caractère (type), puis 3 blocs (proprio / groupe / autres)
- `r`=lire=4, `w`=écrire=2, `x`=exécuter=1, `-`=rien=0
- `chmod 600 fichier` : lecture+écriture pour moi seul (rien pour les autres)
- `chmod 755 fichier` : tous droits pour moi, lecture+exécution pour les autres
- `chmod 644 fichier` : lecture+écriture pour moi, lecture pour les autres

## Administrateur
- `sudo commande` : exécute en tant qu'administrateur (root)
- À utiliser seulement si nécessaire

## Divers
- `Ctrl + C` : annuler / interrompre une commande en cours
- `man commande` : afficher le manuel d'une commande (quitter avec `q`)

## Git (rappel)
- `git status` : voir ce qui a changé
- `git add .` : préparer tous les changements
- `git commit -m "message"` : figer les changements
- `git push` : envoyer sur GitHub

## Redirections avancées
- `commande > fichier` : envoie le résultat normal dans un fichier (écrase)
- `commande 2> fichier` : envoie les ERREURS dans un fichier
- `commande 2> /dev/null` : envoie les erreurs à la poubelle (disparaissent)

## Processus
- `ps` : voir les processus de ma session
- `ps aux` : voir tous les processus du système
- `top` : voir les processus en temps réel (quitter avec `q`)
- `kill PID` : arrêter un processus (avec son numéro PID)
- `commande &` : lancer une commande en arrière-plan

## Rechercher des fichiers
- `find . -name "nom"` : cherche un fichier par nom (dans dossier courant + sous-dossiers)
- `find . -name "*.txt"` : cherche tous les fichiers .txt (le * = n'importe quoi)

## Scripting bash
- `#!/bin/bash` : première ligne obligatoire d'un script (shebang)
- `chmod +x script.sh` : rendre un script exécutable
- `./script.sh` : lancer un script
- `# commentaire` : ligne ignorée par bash (pour expliquer le code)

### Variables
- `nom="valeur"` : créer une variable (PAS d'espace autour du =)
- `$nom` : utiliser la valeur d'une variable
- `total=$(commande)` : ranger le résultat d'une commande dans une variable

### Conditions
- Structure : `if [ condition ]` puis `then` ... `else` ... `fi`
- Espaces obligatoires dans les crochets : `[ ... ]`
- Comparateurs nombres : -eq (égal), -ne (différent), -gt (>), -ge (>=), -lt (<), -le (<=)
- `[ -z "$1" ]` : teste si la variable est vide

### Arguments
- `$1` : premier argument passé au script (`./script.sh argument`)
- `exit 1` : arrêter le script (1 = erreur)

## SQL — commandes de base

### Créer et remplir
- `CREATE TABLE nom (col TYPE, ...)` : créer une table
- `INTEGER` : type nombre entier / `TEXT` : type texte
- `PRIMARY KEY` : clé primaire (identifiant unique de chaque ligne)
- `INSERT INTO table (colonnes) VALUES (valeurs)` : ajouter une ligne
- Texte entre guillemets simples `'...'`, nombres sans guillemets

### Lire
- `SELECT * FROM table` : tout afficher
- `SELECT col1, col2 FROM table` : colonnes précises seulement

### Filtrer
- `WHERE condition` : filtrer les lignes
- Opérateurs : `=` `>` `<` `>=` `<=` `!=`
- `AND` : les deux conditions vraies (restrictif)
- `OR` : au moins une condition vraie (large)

### Trier
- `ORDER BY colonne` : tri croissant (par défaut)
- `ORDER BY colonne DESC` : tri décroissant

### Calculer
- `COUNT(*)` : compter les lignes ("combien")
- `AVG(colonne)` : moyenne
- `SUM(colonne)` : somme totale
- `MIN(colonne)` / `MAX(colonne)` : plus petit / plus grand

### Regrouper
- `GROUP BY colonne` : calculer par catégorie

### Ordre obligatoire des mots-clés
SELECT → FROM → WHERE → GROUP BY → ORDER BY

### Commandes SQLite (avec un point, pas du SQL)
- `.tables` : lister les tables
- `.schema table` : voir la structure d'une table
- `.quit` : quitter SQLite
- `Ctrl+L` : nettoyer l'écran

## SQL — ordre complet des mots-clés (avec JOIN)

SELECT colonne(s)
FROM table1
JOIN table2 ON table1.col = table2.col
WHERE condition
GROUP BY colonne
ORDER BY colonne DESC;

### Règles à retenir
- JOIN avant WHERE
- GROUP BY avant ORDER BY
- WHERE filtre les lignes AVANT le groupement
- JOIN et LEFT JOIN s'écrivent avant tout le reste

### Règle d'or
Toute requête SQL se termine par `;`