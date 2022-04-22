f = File.open("input4.txt", "r")
input = f.read
f.close

boards = input.split("\n\n")
numbers = boards.shift(1).first.split(',')
boards = boards.map{|b| b.split("\n").map{|br| br.split(' ') } }

def mark_board(board, number)
  board.map{|br| br.map{|val| if val == number then "*" else val end }}
end

def is_winner?(board)
  (board + board.transpose).map{|br| br == ['*', '*', '*', '*', '*']}.inject(:|)
end

winners = []
score = nil
numbers.each do |number|
  boards = boards.map{|b| mark_board(b, number) }
  winners = boards.select{|b| is_winner?(b) }
  if winners.size > 0
    score = winners.first.flatten.select{|v| v != '*' }.map{|v| v.to_i }.sum * number.to_i
    break
  end
end

puts score

########### Part 2 ############

boards = input.split("\n\n")
numbers = boards.shift(1).first.split(',')
boards = boards.map{|b| b.split("\n").map{|br| br.split(' ') } }
last_winner = nil
last_number = nil
numbers.each do |number|
  boards = boards.map{|b| mark_board(b, number) }
  winners = boards.select{|b| is_winner?(b) }
  if winners.any?
    last_winner = winners.first
    last_number = number
  end
  boards = boards.select{|b| !is_winner?(b) }
end
score = last_winner.flatten.select{|v| v != '*' }.map{|v| v.to_i }.sum * last_number.to_i

puts score
