def who_is_bigger(a,b,c)
  array = [a, b, c]
  if a == nil || b == nil || c == nil
    then return "nil detected"
  else
    if a == array.max
      then return "a is bigger"
    else
      if b == array.max
        then return "b is bigger"
      else
        return "c is bigger"
      end
    end
  end
end
# voir si on peut pas faire ça avec une fonction plutôt qu'avec 3 if..

def reverse_upcase_noLTA(str)
  return str.reverse.upcase.tr("LTA", "")
end

def array_42(ar)
  ar.find { |each| each == 42 } != nil
end

def magic_array(albert)
  albert.flatten.sort.map{|n|n*2}.delete_if{|n|n%3==0}.uniq
end