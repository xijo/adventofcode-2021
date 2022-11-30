require '../lib/grid'

input = File.read('input').strip.split(?\n)
grid = Grid.new

input.reverse.each_with_index do |line, y|
  line.split('').each_with_index do |c, x|
    grid.set(x, y, c.to_i)
  end
end

@flashes = 0
@step = 0

def print_screen(duration, grid)
  system "clear"
  puts "\n\n  octo flashes:\n\n"
  puts grid.inspect
  puts "\n\n  flashes: #{@flashes}, step: #{@step}"
  sleep duration
end

100.times do |n|
  # grid.clear_marks
  @step = n

  grid.each do |x, y, value|
    grid.increment(x, y)
    color = :"color2#{36 + value}"
    color = :color220 if value == 9
    # color = case value
    # when 0, 1, 2 then :color232
    # when 3, 4 then :color233
    # when 5, 6 then [:on_black, :white]
    # when 7, 8 then [:on_black, :bright_white]
    # when 9 then [:on_black, :red]
    # end
    grid.mark(x, y, color)
    # grid.mark(x, y, [:black]) if value == 1
  end

  print_screen 0.4, grid

  distance = 0

  while grid.any? { |_, _, v| v >= 10 } do
    distance += 1
    grid.each do |x, y, value|
      if value >= 10
        @flashes += 1
        grid.set(x, y, 0)
        # grid.marked?(x, y) or grid.mark(x, y, [:yellow])
        next_color = :"color2#{20 + distance}"
        grid.marked?(x, y, :color220) or grid.mark(x, y, next_color)
        print_screen 0.1, grid

        # print_screen 0.1, grid
        grid.surrounding(x, y).each do |sx, sy|
          grid.increment(sx, sy) if grid.get(sx, sy).nonzero?
        end
      end
    end
  end

  sleep 0.2
end
