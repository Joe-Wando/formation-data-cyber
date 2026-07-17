# Exercices SQL — Correction complète

## Base de données utilisée
- Table `clients` : id, nom, ville, age
- Table `commandes` : id, produit, prix, client_id

---

## Exercice 1
**Énoncé :** Affiche tous les produits commandés et leur prix, triés du plus cher au moins cher.

**Correction :**
SELECT produit, prix FROM commandes ORDER BY prix DESC;

---

## Exercice 2
**Énoncé :** Compte le nombre total de commandes dans la table commandes.

**Correction :**
SELECT COUNT(*) FROM commandes;

---

## Exercice 3
**Énoncé :** Affiche le prix moyen de toutes les commandes.

**Correction :**
SELECT AVG(prix) FROM commandes;

---

## Exercice 4
**Énoncé :** Affiche le nom des clients qui habitent à Lyon, triés par âge croissant.

**Correction :**
SELECT nom, age FROM clients WHERE ville='Lyon' ORDER BY age;

---

## Exercice 5
**Énoncé :** Affiche le produit le plus cher dans la table commandes.

**Correction :**
SELECT produit, MAX(prix) FROM commandes;

---

## Exercice 6
**Énoncé :** Affiche le nom de chaque client et le nombre de commandes qu'il a passées, triés du plus grand nombre au plus petit.

**Correction :**
SELECT clients.nom, COUNT(commandes.produit)
FROM commandes
JOIN clients ON clients.id = commandes.client_id
GROUP BY clients.nom
ORDER BY COUNT(commandes.produit) DESC;

---

## Exercice 7
**Énoncé :** Affiche les clients qui ont passé plus d'une commande.

**Correction :**
SELECT clients.nom, COUNT(commandes.produit)
FROM commandes
JOIN clients ON clients.id = commandes.client_id
GROUP BY clients.nom
HAVING COUNT(commandes.produit) > 1;

---

## Exercice 8
**Énoncé :** Affiche le nom et la ville des clients qui ont commandé un "Cahier".

**Correction :**
SELECT clients.nom, clients.ville
FROM commandes
JOIN clients ON clients.id = commandes.client_id
WHERE commandes.produit = 'Cahier';

---

## Exercice 9
**Énoncé :** Affiche le total des prix de toutes les commandes par ville de client.

**Correction :**
SELECT clients.ville, SUM(commandes.prix)
FROM commandes
JOIN clients ON clients.id = commandes.client_id
GROUP BY clients.ville;

---

## Exercice 10
**Énoncé :** Affiche les villes qui ont un âge moyen de clients supérieur à 30 ans.

**Correction :**
SELECT ville, AVG(age)
FROM clients
GROUP BY ville
HAVING AVG(age) > 30;

---

## Règles SQL à retenir

### Ordre d'écriture
SELECT → FROM → JOIN → WHERE → GROUP BY → HAVING → ORDER BY

### Ordre d'exécution réel
FROM → JOIN → WHERE → GROUP BY → COUNT/SUM → HAVING → SELECT → ORDER BY

### WHERE vs HAVING
- WHERE filtre les lignes AVANT le calcul (colonnes normales)
- HAVING filtre les résultats APRÈS le calcul (COUNT, SUM, AVG...)

### COUNT(*) vs COUNT(colonne)
- COUNT(*) compte toutes les lignes même si NULL
- COUNT(colonne) compte seulement les lignes où la colonne n'est pas NULL
