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
  puts "HOO ça veut dire que tu avais #{a.to_s} ans"

end
