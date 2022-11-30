require '../lib/grid'

input = File.read('example').strip.split(?\n)
grid = Grid.new

input.reverse.each_with_index do |line, y|
  line.split('').each_with_index do |c, x|
    grid.set(x, y, c.to_i)
  end
end

1000.times do |n|
  grid.clear_marks

  grid.each do |x, y, value|
    grid.increment(x, y)
  end

  while grid.any? { |_, _, v| v >= 10 } do
    grid.each do |x, y, value|
      if value >= 10
        grid.set(x, y, 0)
        grid.surrounding(x, y).each do |sx, sy|
          grid.increment(sx, sy) if grid.get(sx, sy).nonzero?
        end
      end
    end
  end

  if grid.all? { |_, _, v| v.zero? }
    puts n + 1
    exit
  end
end
