f = File.open("input3.txt", "r")
input = f.read.split("\n")
f.close

def common_bits(numbers, most_or_least="most")
  operator = if most_or_least == "most" then ">=" else "<" end
  half = numbers.size / 2.0
  bit_columns = numbers.map{|i| i.split('') }.transpose
  column_one_counts = bit_columns.map{|col| col.map{|value| value.to_i }.sum }
  column_one_counts.map{|ones| ones.send(operator, half) ? "1" : "0" }.join
end

gamma = common_bits(input, "most")
epsilon = common_bits(input, "least")
power = gamma.to_i(2) * epsilon.to_i(2)

puts power


########### Part 2 ############


oxygens = input.dup
co2s = input.dup
(0...input.size).each do |i|
  oxygen_bits = common_bits(oxygens, "most")
  co2_bits = common_bits(co2s, "least")
  oxygens = oxygens.select{|line| oxygen_bits[i] == line[i] }  if oxygens.length > 1
  co2s = co2s.select{|line| co2_bits[i] == line[i] }  if co2s.length > 1
end
oxygen = oxygens.first.to_i(2)
co2 = co2s.first.to_i(2)
life_support = oxygen * co2

puts life_support