# Bienvenue dans ce projet THP : The Gossip Project with Sinatra

*Projet réalisé par Aurore CARRIERE - le 06/05/2020*

***********************

### Exercice :

Petite application qui regroupe les potins de THP.


### Comment lancer l'application ?

C'est simple ne t'en fais pas !!
Il suffit d'entrer (séparément) les lignes suivantes dans le terminal :

```
$ bundle install

$ rails db:create

$ rails db:migrate

$ rails db:seed
```

### Comment l'utiliser ?

Ouvrir dans le navigateur : http://localhost:3000/

Bienvenue dans cette petite application où on peut :
* Consulter les derniers ragôts
* L'équipe en charge du projet
* Contacter l'équipe
* Créer un nouveau potin

### Commentaires

V2 :
- Ajout de la création d'un nouveau potin
- Utilisation de routes en resources pour les gossips
- Ajout de messages d'alerte et de notif pour la réussite ou l'échec de création d'un nouveau potin

V3 :
- Ajout d'un peu plus de Bootstrap
- Edit/update/destroy
- Commentaires
- Tags (à faire !)