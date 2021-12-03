require 'fileutils'

numbers = File.read('input').strip.split(?\n)

gamma = numbers.map { |n| n.split('') }.transpose.map { |digits| digits.count(?1) > digits.count(?0) ? ?1 : ?0 }.join.to_i(2)
epsilon = numbers.map { |n| n.split('') }.transpose.map { |digits| digits.count(?1) < digits.count(?0) ? ?1 : ?0 }.join.to_i(2)

puts gamma * epsilon
