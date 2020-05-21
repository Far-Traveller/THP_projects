require 'launchy'

def check_argv
  puts "Enter string after launching the program to search that string on google"
end

def get_url
  url = "https://www.google.com/search?q=" + ARGV.join('+')
end

def perform
  return check_argv if ARGV.empty?
  url = get_url 
  Launchy.open(url)
end

perform()