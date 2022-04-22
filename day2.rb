f = File.open("input2.txt", "r")
input = f.read.split("\n")
f.close
depth = input
  .select{|l| l.include?("up") || l.include?("down") }
  .map{|l| l.gsub("up ", "-") }
  .map{|l| l.gsub("down ", "") }
  .map{|l| l.to_i }
  .sum

position = input
  .select{|l| l.include?("forward") }
  .map{|l| l.gsub("forward ", "").to_i }
  .sum

puts position * depth


########### Part 2 ############


depth = 0
aim = 0
position = 0
input.each do |line|
  if line.include? 'up'
    aim += line.gsub('up ', '-').to_i
  elsif line.include? 'down'
    aim += line.gsub('down ', '').to_i
  elsif line.include? 'forward'
    f = line.gsub("forward ", "").to_i
    position += f
    depth += aim * f
  end
end

puts position * depth
