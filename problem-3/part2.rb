# given a matrix of symbols and numbers and periods
# find all numbers that are adjacent to a symbol
# and return the sum of them
# 
#
# go through each item in matrix check if any neighbouring cells are symbols
# if they are go back and find the start and end of the number
# add it to the total
# skip to the end of the number you've found
# if its a period skip to next
# return the total value 
# 


TEST_GRID = [
["4","6","7",".",".","1","1","4",".","."],
[".",".",".","*",".",".",".",".",".","."],
[".",".","3","5",".",".","6","3","3","."],
[".",".",".",".",".",".","#",".",".","."],
["6","1","7","*",".",".",".",".",".","."],
[".",".",".",".",".","+",".","5","8","."],
[".",".","5","9","2",".",".",".",".","."],
[".",".",".",".",".",".","7","5","5","."],
[".",".",".","$",".","*",".",".",".","."],
[".","6","6","4",".","5","9","8",".","."],
]



def read_file
    matrix = []
    File.foreach("input.txt") do |line|
      matrix << line.chomp.chars
    end

    matrix
end

def calculate_total_engine_schemata
    total = 0
    engine_matrix = read_file
    
    for row in 0..engine_matrix.length - 1
      for col in 0..engine_matrix[0].length - 1
        current_item = engine_matrix[row][col]
        next unless current_item == "*"

        total += gear_ratio(engine_matrix, row, col)
      end
    end

    total
end


def is_number?(element)
    return false if element.nil?
    element.match?(/[0-9]/)
end


def gear_ratio(grid, row, col)
  numbers_adjacent = []

  [-1, 0, 1].each do |i| 
    checked_numbers = {}
    [-1, 0, 1].each do |c|
        next if c == 0 && i == 0
        next if checked_numbers[col+c]

        current_row = grid[row+i]
        next if current_row.nil?

        current_element = current_row[col+c]
        
        if is_number?(current_element)
          start_index = col+c
          end_index = col+c

          loop do
            prev_num = grid[row+i][start_index-1] 

            break if start_index == -1
            break unless is_number?(prev_num) 

            start_index -= 1
          end

          loop do 
            next_num = grid[row+i][end_index+1]

            break if end_index >= grid[row+i].length
            break unless is_number?(next_num)

            end_index += 1
          end
              
          number_length = (end_index - start_index) + 1

          numbers_adjacent << grid[row+i].slice(start_index, number_length).join.to_i

          (start_index..end_index).each { |i| checked_numbers[i] = true }
        end
    end            
  end

  return 0 unless numbers_adjacent.length > 1

  return numbers_adjacent.first * numbers_adjacent.last
end


puts calculate_total_engine_schemata