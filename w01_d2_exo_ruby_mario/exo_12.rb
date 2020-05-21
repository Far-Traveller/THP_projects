puts "Donne nous un nombre :"
print ">"
i = gets.chomp.to_i
total = 0
i.times do
  total += 1
  puts total.to_s
end