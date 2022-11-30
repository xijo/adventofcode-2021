require '../lib/grid'

input = File.read('input').strip.split(?\n)

grid = Grid.new

input.each_with_index do |line, y|
  line.split('').each_with_index do |c, x|
    grid.set(x, y, c.to_i)
  end
end

low = 0
grid.each do |x, y, v|
  low += (v + 1) if grid.adjacent_values(x, y).all? { |a| a > v }
end

puts grid.inspect

puts low.inspect
