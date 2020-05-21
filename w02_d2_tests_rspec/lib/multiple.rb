def is_multiple_of_3_or_5?(current_number)
  if current_number %3 == 0 || current_number %5 == 0
    then return true
  else
    return false
  end
end

def sum_of_3_or_5_multiples(final_number)
  if final_number.is_a?(Float) == true || final_number.is_a?(String) == true || final_number < 0
    return "What are you doing, you stupid! I need integer, so start AGAIN!!"
  else
    all_multiples = []
    (0..final_number-1).each do |n|
      if is_multiple_of_3_or_5?(n) == true
        then all_multiples << n
      end
    end
  end
  return all_multiples.uniq.sum
end
