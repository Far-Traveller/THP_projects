def echo(fuckit)
  return fuckit
end

def shout(imtired)
  return imtired.upcase
end

def repeat1(killme)
  "#{killme} " + "#{killme}"
end

def repeat(marcel, n = 2)
 (marcel + " ") * (n-1) + marcel
end

def start_of_word(myword, num)
  myword[0..num-1]
end

def first_word(fran) #autre méthode : fran.split.first
  fran.partition(" ").first
end

def titleize(p)
  p.capitalize!
  words = p.split(' ')
  words.each do |i|
      unless i=="the" || i =="and"
        i.capitalize!
      end
    end.join(" ")
end
