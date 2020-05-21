def check_argv
  puts "Tu dois rentrer un et un seul string, sans espace, qui sera le nom du fichier"
end 

def folder_name
  ARGV.first
end

def create_folder(name)
  Dir.mkdir('name')
end

def create_gemfile
  system("touch Gemfile")
  file = File.open("Gemfile", "w")
  file.puts("source 'https://rubygems.org'")
  file.puts("ruby '2.5.1'")
  file.puts("gem 'rspec'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'pry'")
  file.puts("gem 'rubocop', '~> 0.57.2'")
  file.close
  system("bundle install")
end

def create_rubocop
  system("touch .rubocop.yml")
  file = File.open(".rubocop.yml", "w")
  file.puts("inherit_from:")
  file.puts(" - http://relaxed.ruby.style/rubocop.yml")
  file.puts("")
  file.puts("AllCops:")
  file.puts(" DisplayStyleGuide: true")
  file.puts(" DisplayCopNames: true")
  file.puts(" Exclude:")
  file.puts("  - 'db/schema.rb'")
  file.puts("  - 'vendor/**/*'")
  file.puts("  - 'config/environments/*.rb'")
  file.puts("  - 'bin/*'")
  file.puts("")
  file.puts("Rails:")
  file.puts(" Enabled: True")
  file.puts("")
  file.puts("Metrics/BlockLength:")
  file.puts("Exclude:")
  file.puts(" - 'spec/**/*.rb'")
  file.puts(" - 'Guardfile'")
  file.puts(" - 'vendor/bundle'")
  file.close
end

def create_readme
  system('touch README.md')
  file = File.open("README.md", "w")
  file.puts('Ceci est un programme ruby.')
  file.close
end

def perform
  return check_argv if ARGV.empty? || ARGV.size > 1
  Dir.mkdir(folder_name)
  Dir.chdir(folder_name)
  create_gemfile
  create_rubocop
  system("git init")
  system('touch .gitignore')
  system("touch .env")
  file = File.open(".gitignore", "w")
  file.puts('.env')
  file.close
  Dir.mkdir('lib')
  system('rspec --init')
  create_readme
end

perform()