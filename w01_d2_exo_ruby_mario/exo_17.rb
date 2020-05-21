puts "Quelle est ton année de naissance:"
print ">"
year = gets.chomp.to_i
today = 2020
i = today - year
a = 0
i.times do
  year += 1
  puts year.to_s
  a += 1
  i -=1
  

if a == i 
  puts "Il y a #{i} ans tu avais la moitié de l'âge que tu as aujourd'hui"
else 
  puts "Il y a #{i} ans, tu avais #{a.to_s} ans"

end
end
