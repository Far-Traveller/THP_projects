// Un prompt s'affiche avec la question suivante
number = prompt('De quel nombre veux-tu calculer la factorielle ?');

// Utilisateur rentre un nombre (par ex 4)
// Dans la console le résultat suivant est affiché
// "Le résultat est : 24"

function fact(nbr) {
  var i, nbr, f = 1;
  for(i = 1; i <= nbr; i++) {
    f = f * i;   // ou f *= i;
  }  
  return f;
}

console.log(`Le résultat est : ${fact(number)}`)