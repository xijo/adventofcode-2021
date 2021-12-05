lines = File.read('input').strip.split(?\n).map do |line|
  line.split(' -> ').map { |p| p.split(?,).map(&:to_i) }
end

def expand_straight(from, to)
  x_range = Range.new(*[from.first, to.first].sort)
  y_range = Range.new(*[from.last, to.last].sort)
  result = []
  x_range.each do |x|
    y_range.each do |y|
      result << [x, y]
    end
  end
  result
end

def straight?(from, to)
  from.first == to.first || from.last == to.last
end

def expand(*l)
  straight?(*l) ? expand_straight(*l) : expand_diagonal(*l)
end

def expand_diagonal(from, to)
  x_dis = to.first - from.first
  y_dis = to.last - from.last
  x_dir = x_dis.negative? ? -1 : 1
  y_dir = y_dis.negative? ? -1 : 1
  result = [from]

  x_dis.abs.times do
    new_point = result.last.dup
    new_point[0] += x_dir
    new_point[1] += y_dir
    result << new_point
  end

  result
end

valves = lines.map { |l| expand(*l) }.flatten(1)

puts valves.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.values.select { |v| v > 1 }.size
