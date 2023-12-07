# go through each game in the input
# and find the max value of each cube colour
# multiply the cube colour maxes for each game
# sum the value of each game
#

def read_file
    lines = []

    File.foreach("input.txt") do |line|
      lines << line.chomp
    end

    lines
end

def calulcate_power_of_all_games
    games = read_file

    game_powers = []

    games.each do |game|
        _game_id, sets = game.split(":")

        game_powers << calculate_game_power(sets)
    end

    game_powers.sum
end

def calculate_game_power(sets)
    max_red = 1
    max_blue = 1
    max_green = 1

    sets = sets.split(";")
    
    sets.each do |set| 
      cubes = set.split(',')

      cubes.each do |cube|
        no_of_cubes, cube_colour = cube.split(' ')

          case(cube_colour)
          when "green"
            max_green = no_of_cubes.to_i if no_of_cubes.to_i > max_green       
          when "red"
            max_red = no_of_cubes.to_i if no_of_cubes.to_i > max_red  
          when "blue"
            max_blue = no_of_cubes.to_i if no_of_cubes.to_i > max_blue                          
          end
      end     
    end

    return max_red * max_blue * max_green
end

puts calulcate_power_of_all_games