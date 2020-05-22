const books = [
  { title: 'Gatsby le magnifique', id: 133712, rented: 39 },
  { title: 'A la recherche du temps,perdu', id: 237634, rented: 28 },
  { title: 'Orgueil & Préjugés', id: 873495, rented: 67 },
  { title: 'Les frères Karamazov', id: 450911, rented: 55 },
  { title: 'Dans les forêts de Sibérie', id: 8376365, rented: 15 },
  { title: 'Pourquoi j\'ai mangé mon père', id: 450911, rented: 45 },
  { title: 'Et on tuera tous les affreux', id: 67565, rented: 36 },
  { title: 'Le meilleur des mondes', id: 88847, rented: 58 },
  { title: 'La disparition', id: 364445, rented: 33 },
  { title: 'La lune seule le sait', id: 63541, rented: 43 },
  { title: 'Voyage au centre de la Terre', id: 4656388, rented: 38 },
  { title: 'Guerre et Paix', id: 748147, rented: 19 }
];


//Est-ce que tous les livres ont été au moins empruntés une fois ?
/*const rentedAtLeast1 = books.forEach( book => {
  if(book.rented === 0) {
    console.log('"${book.title}" n\'a jamais été emprunté');
  } else {
    console.log(`"${book.title}" a été emprunté ${book.rented} fois`)
  }
})*/
if(books.some(book => book.rented === 0)){
  console.log("Au moins un livre n'a jamais été emprunté");
} else{
  console.log("Tous les livres ont été empruntés au moins une fois");
}

console.log('-'.repeat(30))

const sortedByRent = books.slice()
sortedByRent.sort(function(a, b){
  if(a.rented < b.rented) { return -1; }
  if(a.rented > b.rented) { return 1; }
  return 0;
})

//Quel est livre le plus emprunté ?
console.log(`Le livre le plus emprunté est : ${sortedByRent[sortedByRent.length - 1].title}`)

console.log('-'.repeat(30))

//Quel est le livre le moins emprunté ?
console.log(`Le livre le moins emprunté est : ${sortedByRent[0].title}`)

console.log('-'.repeat(30))


function search(idKey, myArray) {
  for(var i=0; i < myArray.length ; i++) {
    if(myArray[i].id === idKey) {
      return myArray[i];
    }
  }
}

//Trouve le livre avec l'ID: 873495 ;
let bookId873495 = search(873495, books)
console.log(`Le livre avec l'ID 873495 est ${bookId873495.title}`)

console.log('-'.repeat(30))

//Supprime le livre avec l'ID: 133712 ;
let bookId133712 = search(873495, books)
let deleteBook = books.splice(bookId133712, 1)
console.log(`Le livre avec l'ID 133712 a bien été supprimé !`)

console.log('-'.repeat(30))

//Trie les livres par ordre alphabétique (sans celui avec l'ID 133712 car il est supprimé).
const sortedByTitle = books.sort(function(a, b){
  if(a.title < b.title) { return -1; }
  if(a.title > b.title) { return 1; }
  return 0;
})
console.log(sortedByTitle)
