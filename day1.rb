f = File.open("input1.txt", "r")
input = f.read.split("\n").map{|l| l.to_i }
f.close
previous = input.first
increases = 0
input.drop(1).each do |line|
  increases += 1  if line > previous
  previous = line
end
puts increases


########### Part 2 ############


f = File.open("input1.txt", "r")
input = f.read.split("\n").map{|l| l.to_i }
f.close
increases = 0
window = input.first(3)
previous = window.sum
input.drop(3).each do |line|
  window = window.push(line).last(3)
  increases += 1  if window.sum > previous
  previous = window.sum
end
puts increases
