puts "Quelle est ton année de naissance:"
print ">"
year = gets.chomp.to_i
today = 2020
i = today - year
i.times do
  year += 1
  puts year.to_s
end