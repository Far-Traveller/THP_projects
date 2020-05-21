puts "Bonjour, quel est ton année de naissance? "
print ">"
Year_of_Birth = gets.chomp.to_i
Year = 2017
a = Year - Year_of_Birth
puts "Hooo cela veut dire qu'en 2017 tu avais #{ a } ans."