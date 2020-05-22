const entrepreneurs = [
  { first: 'Steve', last: 'Jobs', year: 1955 },
  { first: 'Oprah', last: 'Winfrey', year: 1954 },
  { first: 'Bill', last: 'Gates', year: 1955 },
  { first: 'Sheryl', last: 'Sandberg', year: 1969 },
  { first: 'Mark', last: 'Zuckerberg', year: 1984 },
  { first: 'Beyonce', last: 'Knowles', year: 1981 },
  { first: 'Jeff', last: 'Bezos', year: 1964 },
  { first: 'Diane', last: 'Hendricks', year: 1947 },
  { first: 'Elon', last: 'Musk', year: 1971 },
  { first: 'Marissa', last: 'Mayer', year: 1975 },
  { first: 'Walt', last: 'Disney', year: 1901 },
  { first: 'Larry', last: 'Page', year: 1973 },
  { first: 'Jack', last: 'Dorsey', year: 1976 },
  { first: 'Evan', last: 'Spiegel', year: 1990 },
  { first: 'Brian', last: 'Chesky', year: 1981 },
  { first: 'Travis', last: 'Kalanick', year: 1976 },
  { first: 'Marc', last: 'Andreessen', year: 1971 },
  { first: 'Peter', last: 'Thiel', year: 1967 }
];


//Filtre dans cette liste les entrepreneurs qui sont nés dans les années 70 ;
const born1970 = entrepreneurs.filter(element => element.year >= 1970 && element.year <= 1979);
console.log('Voici les entrepreneurs nés dans les années 70 :')
console.log(born1970)

console.log('-'.repeat(30))

//Sors une array qui contient le prénom et le nom des entrepreneurs ;
console.log('Voici les prénoms et noms de tous les entrepreneurs :')

const fullName = entrepreneurs.forEach(element => {
  console.log(element.first + ' ' + element.last)
} );

console.log('-'.repeat(30))

//Quel âge aurait chaque inventeur aujourd'hui ?
let currentYear = new Date().getFullYear()

console.log('Quel âge ont/auraient-ils aujourd\'hui ?')

const ageToday = entrepreneurs.forEach(element => {
  console.log(`${element.first} a/aurait ${currentYear - element.year} ans`)
} );

console.log('-'.repeat(30))

//Trie les entrepreneurs par ordre alphabétique du nom de famille.
const sortedByLast = entrepreneurs.sort(function(a, b){
  if(a.last < b.last) { return -1; }
  if(a.last > b.last) { return 1; }
  return 0;
})
console.log(sortedByLast)
//tri : https://stackoverflow.com/questions/6712034/sort-array-by-firstname-alphabetically-in-javascript

