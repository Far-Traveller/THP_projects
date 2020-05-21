def time_string(t) #ou dire directement %T
  Time.at(t).utc.strftime("%H:%M:%S")
end