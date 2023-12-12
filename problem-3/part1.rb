# given a matrix of symbols and numbers and periods
# find all numbers that are adjacent to a symbol
# and return the sum of them
# 
#
#
# go through each item in matrix check if any neighbouring cells are symbols
# if they are go back and find the start and end of the number
# add it to the total
# skip to the end of the number you've found
# if its a period skip to next
# return the total value 
# 
require 'pry'

def read_file
    matrix = []
    File.foreach("input.txt") do |line|
      matrix << line.chomp.chars
    end

    matrix
end

SYMBOLS = [
  "*", "$", "%", "£", "@", "#", "-", "+", "=", "/", "&"
]

def calculate_total_engine_schemata
    total = 0
    engine_matrix = read_file
    
    for row in 0..engine_matrix.length - 1
      checked_numbers = {}
      for col in 0..engine_matrix[0].length - 1
        current_item = engine_matrix[row][col]

        next if checked_numbers[col]
        next unless is_number?(current_item)
        next unless number_has_symbol_adjacent?(engine_matrix, row, col)

        start_index = col
        end_index = col

        loop do
          prev_num = engine_matrix[row][start_index-1] 

          break if start_index == -1
          break unless is_number?(prev_num) 

          start_index -= 1
        end

        loop do 
          next_num = engine_matrix[row][end_index+1]

          break if end_index >= engine_matrix[row].length
          break unless is_number?(next_num)

          end_index += 1
        end
        
        number_length = (end_index + 1) - start_index
        number = engine_matrix[row].slice(start_index, number_length).join.to_i
        puts "Adding number #{number} to total"

        total += number

        (start_index..end_index).each { |i| checked_numbers[i] = true}
      end
    end

    total
end

def is_number?(element)
    return false if element.nil?
    element.match?(/[0-9]/)
end

def number_has_symbol_adjacent?(grid, row, col)
  [-1, 0, 1].each do |i| 
    [-1, 0, 1].each do |c|
        next if c == 0 && i == 0
        current_row = grid[row+i]
        next if current_row.nil?

        current_element = current_row[col+c]
        return true if SYMBOLS.include?(current_element)
    end            
   end
  false
end

puts calculate_total_engine_schemata