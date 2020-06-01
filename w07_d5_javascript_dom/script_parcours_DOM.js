/*Sache que pour obtenir la réponse de chaque question, une seule ligne de code JS suffit .
On te dit ça pour ton information, afin que sur cet exercice
1) tu n'écrives pas de fonction (pour le moment) et
2) tu ne partes pas dans des délires compliqués de boucles ou autre.
Toutefois, comme le code sur une seule ligne c'est illisible, n'hésite pas à découper chaque réponse en plusieurs lignes bien claires.*/

//Question 1 : Combien y a-t-il d'éléments <p> présents dans la page HTML ? Imprime-le résultat dans la console.
{
  let p = document.getElementsByTagName('p');
  console.log(`Il y a ${p.length} éléments <p>`);
}

console.log('-'.repeat(10))

//Question 2 : Quel est le contenu texte de l'élément portant l'id coucou ? Imprime-le dans la console.
{
  let coucou = document.getElementById('coucou').textContent;
  console.log(`Contenu de l'élément portant l'id coucou : ${coucou}`);
}

console.log('-'.repeat(10))

//Question 3 : Quelle est l'URL vers laquelle pointe le 3ème élément <a> de la page HTML ? Imprime-la dans la console.
{
  let aThird = document.getElementsByTagName('a')[2].href;
  console.log(`Le 3ème élément <a> pointe vers l'url est : ${aThird}`);
}

console.log('-'.repeat(10))

//Question 4 : Combien d'éléments portent la classe compte-moi ? Imprime le résultat dans la console.
{
  let classCount = document.getElementsByClassName('compte-moi');
  console.log(`${classCount.length} éléments portent la classe compte-moi`);
}

console.log('-'.repeat(10))

//Question 5 : Combien d'éléments <li> portent la classe compte-moi ? Imprime le résultat dans la console.
{
  let liCount = document.querySelectorAll("li.compte-moi");
  console.log(`${liCount.length} éléments <li> portent la classe compte-moi`);
}

console.log('-'.repeat(10))

//Question 6 : Combien d'éléments <li> et situés dans une liste ordonnée portent la classe compte-moi ? Imprime le résultat dans la console.
{
  let olTag = document.getElementsByTagName('ol')[0];
  let liCountOrd = olTag.querySelectorAll("li.compte-moi");
  console.log(`${liCountOrd.length} éléments <li> et situés dans une liste ordonnée portent la classe compte-moi`)
}

console.log('-'.repeat(10))

//Question 7 : Petit jeu de piste à résoudre si possible sans regarder le fichier HTML…
/*La page contient un seul élément <div>. Celui-ci contient 2 éléments "unordered list" ou <ul>.
Dans le second <ul>, le premier élément de la liste (tag <li>) est caché visuellement de l'utilisateur mais toi,
tu peux en récupérer le contenu. Affiche-le dans la console.*/

{
  let secretContent = document.getElementsByTagName('div')[0].getElementsByTagName('ul')[1].getElementsByTagName('li')[0].textContent;
  console.log(`le contenu secret est : ${secretContent}`)
}