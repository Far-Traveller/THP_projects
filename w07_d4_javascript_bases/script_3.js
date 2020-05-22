const stairs = prompt('Salut, bienvenue dans ma super pyramide ! Donnes-moi un nombre d\'etages ?');

let n = 1
let s = stairs - 1

console.log("Voici ta magnifique pyramide :");

while(n <= stairs) {
  console.log(' '.repeat(s) + '#'.repeat(n))
  n += 1
  s -= 1
}