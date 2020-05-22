// L'utilisateur pourra y saisir sa phrase et le bot répondra via une impression en console.
const sentence = prompt('Bonjour, je suis Bernard le Bot, que veux-tu me dire ?');

/*Les règles de conversations du bot sont les suivantes
(rangées par priorité - si deux règles sont vraies, seule la plus haute dans la liste s'applique) :

Si on lui pose une question (= la phrase finie par "?"), le bot répond "Ouais Ouais..." ;
Si on lui hurle trop dessus (= la phrase est 100% en majuscules), le bot répond "Pwa, calme-toi..." ;
Si la phrase que tu prononces contient le mot "Fortnite", le bot répond "on s' fait une partie soum-soum ?" ;
Si on lui envoie un message vide, le bot répond "t'es en PLS ?" ;
Pour tout autre phrase que tu lui envoies, le bot répond "balek." ;*/

switch (true) {
  case sentence.endsWith('?'):
    console.log("Ouais Ouais...");
    break;
  case sentence === sentence.toUpperCase() && sentence != "":
    console.log("Pwa, calme-toi...");
    break;
  case sentence.includes('Fortnite'):
    console.log("on s' fait une partie soum-soum ?");
    break;
  case sentence === "":
    console.log("t'es en PLS ?");
    break;

  default:
    console.log("balek.");
    break;
}