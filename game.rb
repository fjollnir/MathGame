require_relative 'player'

def create_player
  puts "What is namehhhhh?"
  player_name = gets.chomp
  player = Player.new(player_name, @lives, @score)

  #describe player's stats
  puts "Player name is #{player.name}"
  puts "#{player.name}'s lives = #{player.lives}"
  return player
end

def validation(player, correct_answer, player_answer)
  if correct_answer == player_answer
    puts "DING DING DING"
    player.score += 1
    puts "Your score is now = #{player.score}"
  else
    puts "WRONG!!!!!!"
    player.lives -= 1
    puts "Your life is now = #{player.lives}"
  end
end

def questions(player, answer)
  random_1 = rand(1..20)
  random_2 = rand(1..20)

  puts "#{player.name}! What is #{random_1} + #{random_2}"
  answer = gets.chomp.to_i

  correct_answer = random_1 + random_2
  validation(player, correct_answer, answer)

end

def rounds(player)
  questions(player, '')
end

def life_check(player)
  if player.lives == 0
    puts "Game over"
  end
end

class Game
  # Create Players
  player_1 = create_player
  player_2 = create_player

  players = [player_1, player_2]

  players.each do |player|
    while player.lives > 0 do
      rounds(player)
      life_check(player)
    end
  end
end

Game.new
