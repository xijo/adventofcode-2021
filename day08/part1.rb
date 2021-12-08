require 'byebug'

input = File.read('input').strip.gsub(/.*\|/, '').split(" ").map(&:strip)

known_sizes = [2, 3, 4, 7]

puts input.select { |p| known_sizes.include?(p.length) }.size
