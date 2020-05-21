def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(ar)
  ar.sum
end

def multiply(num1, num2)
  num1 * num2
end

def power(num1, num2)
  num1 ** num2
end

def factorial(num1) #autre foncion qui fonctionne : Math.gamma(num1+1)
  (1..(num1.zero? ? 1 : num1)).inject(:*)
end