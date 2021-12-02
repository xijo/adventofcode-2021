require 'fileutils'

depths = File.read('input').strip.split(?\n).map(&:to_i)

window_depths = []

depths.each_with_index do |depth, i|
  window = depths[i, 3].map(&:to_i)
  window.size == 3 and window_depths << window.sum
end

inc = 0

window_depths.each_with_index do |window_depth, i|
  inc += 1 if window_depth > window_depths[i-1]
end

puts inc
