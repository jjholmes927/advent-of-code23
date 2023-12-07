# each line is a string of numbers and letters
# make a two digit number from each line by combining the first digit in the line and last
# sum the two digit number from each line together to get the calibration task
# 
#
# go through each line get the first and last number
# 
# include spelled out words 1-9

def read_file
    file_lines = []

    File.foreach("input.txt") do |line| 
      file_lines << line.chomp
    end

    file_lines
end

VALID_SPELLED_NUMBERS = {
  "one" => "o1e",
  "two" => "t2o",
  "three" => "t3e",
  "four" => "f4r",
  "five" => "f5e",
  "six" => "s6x",
  "seven" => "s7n",
  "eight" => "e8t",
  "nine" => "n9e"
}


TEST_INPUT = [
"two1nine",
"eightwothree",
"abcone2threexyz",
"xtwone3four",
"4nineeightseven2",
"zoneight234",
"7pqrstsixteen"
]

def calculate_calibration
    file_lines = read_file

    calibration_numbers = file_lines.map do |line|
      VALID_SPELLED_NUMBERS.each do |key, value|
        line.gsub!(Regexp.new("#{key}"), value)
      end

      valid_calibration_values = line.scan(/[0-9]/)

      first_num = valid_calibration_values.first
      second_num = valid_calibration_values.last

      two_digit_num = first_num + second_num

      two_digit_num.to_i
    end


    return calibration_numbers.sum
end


puts calculate_calibration