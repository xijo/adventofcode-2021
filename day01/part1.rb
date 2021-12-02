require 'fileutils'

depths = File.read('input').strip.split(?\n).map(&:to_i)

inc = 0

depths.each_with_index do |depth, i|
  inc += 1 if depth > depths[i-1]
end

puts inc
