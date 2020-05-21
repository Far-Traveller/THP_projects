# temperature conversion functions

def ftoc(fahrenheit_degrees)
  celsius = (fahrenheit_degrees - 32) * 5.0 / 9.0
  celsius.round(1)
end


def ctof(celsius_degrees)
  fahrenheit = (celsius_degrees * 9.0 / 5.0) + 32
  fahrenheit.round(1)
end