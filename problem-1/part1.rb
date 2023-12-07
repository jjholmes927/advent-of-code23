# each line is a string of numbers and letters
# make a two digit number from each line by combining the first digit in the line and last
# sum the two digit number from each line together to get the calibration task
# 
#
# go through each line get the first and last number
# 
#

require 'pry'

def read_file
    file_lines = []

    File.foreach("input.txt") do |line| 
      file_lines << line.chomp
    end

    file_lines
end

def calculate_calibration
    file_lines = read_file

    calibration_numbers = file_lines.map do |line|
      line.gsub!(/[^0-9]/, '')

      line = line[0] + line[line.length - 1]

      line.to_i
    end

    return calibration_numbers.sum
end



puts calculate_calibration