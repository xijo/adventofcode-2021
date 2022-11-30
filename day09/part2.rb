require '../lib/grid'

input = File.read('input').strip.split(?\n)
grid = Grid.new

input.each_with_index do |line, y|
  line.split('').each_with_index do |c, x|
    grid.set(x, y, c.to_i)
  end
end

basins = []

grid.each do |x, y, value|
  next if value == 9
  next if basins.any? { |basin| basin.include?([x, y]) }
  basin = [[x, y]]
  to_check = [[x, y]]

  while to_check.size > 0 do
    x, y = to_check.pop
    next_points = grid.adjacent(x, y)
    next_points.each do |point|
      next if basin.include?(point)
      next if grid.get(*point) == 9
      basin << point
      to_check << point
    end
  end

  basins << basin
end

puts basins.map(&:size).max(3).inject(:*).inspect

basins.each do |basin|
  basin.each do |point|
    grid.mark(*point)
  end
end

puts grid.inspect
