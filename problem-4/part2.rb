# puzzle input has a set of cards
# on the left side are the numbers elf has
# right side are winning numbers
# 1 point for first match and then doubled each time for a subsequent match
# return the sum of the points of each card
# 
#
#
#
# read the puzzle input
# 
#
#
# instead of getting points
# each matching number wins you one copy of a subsequent card
# 
#
# calculate the 

def read_file
    cards = []

    File.foreach("input.txt") do |line|
      cards << line.chomp
    end

    cards
end

def calculate_total_scratch_card_points
    scratch_cards = read_file

    card_copies = {}
    (1..scratch_cards.count).each {|i| card_copies[i] = 1 }


    # so work out hiw many matches you have
    # add 1 * current copies to the next n cards where n is the number of matching numbers

    scratch_cards.each do |card|
      card_matches = []

      card_no, numbers = card.split(":")
      card_no = card_no.split(' ').last.to_i

      elfs_numbers, winning_numbers = numbers.split("|") 

      elfs_numbers = elfs_numbers.split(' ') 
      winning_numbers = winning_numbers.split(' ')

      elfs_numbers.each { |num| card_matches << num if winning_numbers.include?(num) }

      i = 1
      
      while card_matches.count > 0
        card_matches.pop
        card_copies[card_no+i] += card_copies[card_no]
        i += 1 
      end
    end

    puts card_copies.values.sum
end

puts calculate_total_scratch_card_points


