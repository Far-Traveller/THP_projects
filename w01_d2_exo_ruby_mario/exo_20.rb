

puts "Salut, bienvenue dans ma super pyramide ! Combien d'étages veux-tu ?"
print ">"
stairs = gets.chomp.to_i

until stairs < 26 && stairs > 0
 puts "Mais ? Que racontes-tu ! C'est impossible... Recommences"
 print ">"
 stairs = gets.chomp.to_i
end
if stairs < 26 && stairs > 0
n = 1

  while n <= stairs
    puts ("#" * n)
    n += 1
end  

end