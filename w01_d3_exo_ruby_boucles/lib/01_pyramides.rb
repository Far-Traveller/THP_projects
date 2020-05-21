def ask_user
  puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ? (entre 1 et 25)"
  print ">"
  stairs = gets.chomp.to_i
  until stairs < 26 && stairs > 0
   puts "Mais ? Que racontes-tu ! C'est impossible... !! Recommences"
   print">"
   stairs = gets.chomp.to_i
  end
  return stairs
end


def half_pyramid(stairs)
  n = 1
  s = stairs-n
    puts "Voici la magnifique pyramide inversée de oiraM :"

  while n <= stairs
    puts (" "*s+"#"*n)
    n += 1
    s -= 1
  end
end

def full_pyramid(stairs)
  n = 1
  s = stairs-n
    puts "Voici la pyramide que tu m'as demandé :"

  while n <= stairs
    puts (" "*s+"#"*n)
    n += 2
    s -= 1
  end
end

def ask_user_wtf
  puts "Salut, bienvenue dans ma pyramide wtf ! Combien d'étages veux-tu ? (un nombre impair entre 1 et 25)"
  print ">"
  stairs_wtf = gets.chomp.to_i
  return stairs_wtf
end

def wtf_pyramid
  stairs_wtf = ask_user_wtf
  until stairs_wtf < 26 && stairs_wtf > 0 && stairs_wtf % 2 != 0
   puts "Mais ? Que racontes-tu ! C'est impossible... !! Recommences"
   print">"
   stairs_wtf = gets.chomp.to_i
  end
  result = stairs_wtf.to_i / 2.0
  i = 1
  x = result.ceil
  j = result.floor
  puts "Voici la pyramide : "
  x.times do
    print " " * x
    puts "#" * i
    i += 2
    x -= 1
  end
  i -=4
  x += 2
  j.times do
    print " " * x
    puts "#" * i
    i -=2
    x += 1
  end
end

wtf_pyramid