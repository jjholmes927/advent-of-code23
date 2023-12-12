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


TEST_INPUT = [
  "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53",
  "Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19",
  "Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1",
  "Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83",
  "Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36",
  "Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
]

def read_file
    cards = []

    File.foreach("input.txt") do |line|
      cards << line.chomp.split(":").last
    end

    cards
end

def calculate_total_scratch_card_points
    total = 0

    scratch_cards = TEST_INPUT
    
    scratch_cards.each do |card|
      card_matches = []
      card_total = 0

      elfs_numbers, winning_numbers = card.split("|")

      elfs_numbers = elfs_numbers.split(' ') 
      winning_numbers = winning_numbers.split(' ')

      elfs_numbers.each { |num| card_matches << num if winning_numbers.include?(num) }

      while card_matches.count > 0
        card_matches.pop
        
        if card_total == 0
          card_total += 1
        else
          card_total *= 2
        end

      end

      total += card_total
    end

    puts total
end

puts calculate_total_scratch_card_points


