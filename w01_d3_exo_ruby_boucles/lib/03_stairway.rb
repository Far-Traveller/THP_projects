def welcome
  puts "Bienvenue dans cette version info du jeu de l'oie"
  puts "Le joueur est tout en bas d'un escalier à 10 marches, et à chaque tour il va lancer un dé !"
  puts "Let's go Bitches !"
end
 
def dice
  result = rand(0..6)
  return result
end

def go_up(stair)
  stair += 1
  puts "Wesh gros ! Tu montes à la marche #{stair} !"  
  return stair
end

def go_down(stair)
  if stair == 0
    puts "Lol t'es déjà au sol, tu veux creuser pour aller plus bas ??"
    return stair
  else
    stair -= 1
    puts "Oups, une peau de banane... Tu glisses et arrives à la marche #{stair}..."
    return stair
  end
end

def perform(stair, rounds)
  result = dice
  rounds += 1
  case result
  when 1
    stair = go_down(stair)
    return perform(stair, rounds)
  when 2..4
    puts "Restes là ! Plus bouger !!"
    return perform(stair, rounds)
  else 5..6
    stair = go_up(stair)
    if stair < 10
      return perform(stair, rounds)
    else 
      puts "Game Over... Non je déconne ! T'as gagné champion !"
      return rounds
    end
  end
end

def average
  all_rounds = []
  100.times do 
    round = perform(0, 0)
    all_rounds << round 
  end
  average_rounds = all_rounds.inject(0.0) { |sum, n| sum + n} / all_rounds.size
  return puts "Environ #{average_rounds} par partie"
end

average