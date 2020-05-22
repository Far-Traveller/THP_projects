const arn1 = "CCGUCGUUGCGCUACAGC"
const arn2 = "CCUCGCCGGUACUUCUCG"

//On commence par couper le string tous les 3 caractères et les mettre dans un array
const arnModified = (string) => {return string.match(/.{1,3}/g)}

//Ensuite on crée un fonction qui va lire codons (Suite de 3 cara) et renvoyer un acide aminé
const transfAA = (string) => { //le => permet d'attribuer une fonction à transfAA
  if(string === 'UCU' || string === 'UCC' || string === 'UCA' || string === 'UCG' || string === 'AGU' || string === 'AGC') {
    return 'Sérine'
  } else if (string === 'CCU' || string === 'CCC' || string === 'CCA' || string === 'CCG') {
      return 'Proline'
    } else if (string === 'UUA' || string === 'UUG') {
      return 'Leucine'
      } else if (string === 'UUU' || string === 'UUC') {
          return 'Phénylalanine'
        } else if (string === 'CGU' || string === 'CGC' || string === 'CGA' || string === 'CGG'|| string === 'AGA'|| string === 'AGG') {
            return 'Arginine'
          } else if (string === 'UAU' || string === 'UAC') {
              return 'Tyrosine'
  }
}

//On fait une boucle pour que tous les codons de l'ARN soit lu
var modifiedARN = new Array
const transfAllARN = (array) => {
  modifiedARN = [];
  array.forEach(codon => {
    modifiedARN.push(transfAA(codon))
  })
}

//Enfin on transforme l'array obtenu en un string avec des - entre chaque AA
const nucleotide = (array) => {
  return modifiedARN.join("-")
}

let nucleotideArn1 = console.log(`Le nucléotide de l'ARN CCGUCGUUGCGCUACAGC est : \n ${nucleotide(transfAllARN(arnModified(arn1)))}`)

let nucleotideArn2 = console.log(`Le nucléotide de l'ARN CCUCGCCGGUACUUCUCG est : \n ${nucleotide(transfAllARN(arnModified(arn2)))}`)