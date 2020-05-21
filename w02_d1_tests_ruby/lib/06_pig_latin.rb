def translate(fuckit)

 if fuckit.start_with?('a','e','i','o','u')
    fuckit << "ay"
  else
    if fuckit.start_with?('a','e','i','o','u') == false
    return fuckit.reverse << "ay"
      else 
        if ["a", "e", "i", "o", "u"].include?(fuckit[1]) == false
          then cons << fuckit[1]

          if ["a", "e", "i", "o", "u"].include?(fuckit[2]) == false
            then cons << fuckit[2]
          end
        end
        return "#{fuckit[cons.length..-1] + cons.join + "ay"}"
        end
    end

end
