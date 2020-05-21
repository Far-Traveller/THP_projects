puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print ">"
stairs = gets.chomp.to_i
i= 1

until stairs < 26 && stairs > 0
 puts "Mais ? Que racontes-tu ! C'est impossible... Recommences"
 print">"
 stairs = gets.chomp.to_i
end
if stairs < 26 && stairs > 0
n = 1
s = stairs-n
  puts "Voici la magnifique pyramide inversée de oiraM :"


  while n <= stairs
    puts (" "*s+"#"*n)
    n += 1
    s -= 1
end  

end


