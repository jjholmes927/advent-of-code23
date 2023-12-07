# go through each game in the input
# and check if any of the sets exceed the number of cubes of each colour possible
# if the game is possible add the game id to possible games output
# sum the game ids of all the possible games
# 
#
# 12 red cubes, 13 green cubes, and 14 blue cubes in the bag
# 

require 'pry'

MAX_CUBES_AVAILABLE = {
  "red" => 12,
  "green" => 13,
  "blue" => 14
}

def read_file
    lines = []

    File.foreach("input.txt") do |line|
      lines << line.chomp
    end

    lines
end


def calulcate_possible_games
    games = read_file

    possible_game_ids = []

    games.each do |game|
        game_id, sets = game.split(":")

        # split the sets
        # go through each set and check if split is valid
        # if its invalid skip to the next game
        # if all the sets are valid store game id in possible games

        sets = sets.split(";")

        next unless sets.all? { |set| valid_set?(set) }

        possible_game_ids << game_id.split(' ').last.to_i 
    end

    possible_game_ids.sum
end



def valid_set?(set)
    cubes = set.split(',')

    cubes.each do |cube|
      no_of_cubes, cube_colour = cube.split(' ')
      return false if MAX_CUBES_AVAILABLE[cube_colour] < no_of_cubes.to_i
    end

    true
end

puts calulcate_possible_games