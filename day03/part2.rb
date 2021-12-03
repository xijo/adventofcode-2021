require 'fileutils'

numbers = File.read('input').strip.split(?\n)
length = numbers.first.size

def most_common(list, position)
  digits = list.map { |n| n.split('') }.transpose[position]
  ones = digits.count(?1)
  zeros = digits.count(?0)
  ones == zeros and return
  ones > zeros ? ?1 : ?0
end

def least_common(list, position)
  digits = list.map { |n| n.split('') }.transpose[position]
  ones = digits.count(?1)
  zeros = digits.count(?0)
  ones == zeros and return
  ones < zeros ? ?1 : ?0
end

oxygen = numbers.dup

(0..length-1).each do |position|
  oxygen.size == 1 and break
  mc = most_common(oxygen, position) || ?1
  oxygen = oxygen.select { |o| o[position] == mc }
end

puts "oxygen: #{oxygen.first.to_i(2)}"

co2 = numbers.dup

(0..length-1).each do |position|
  co2.size == 1 and break
  lc = least_common(co2, position) || ?0
  co2 = co2.select { |o| o[position] == lc }
end

puts "co2: #{co2.first.to_i(2)}"

puts oxygen.first.to_i(2) * co2.first.to_i(2)
