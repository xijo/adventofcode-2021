require 'fortschritt'
input = File.read('input').strip.split(?,).map(&:to_i)

fishes = Array.new(0)
(0..8).to_a.each { |i| fishes[i] = input.count(i) }

256.times do
  fishes = fishes.rotate
  fishes[6] += fishes[8]
end

puts fishes.sum
