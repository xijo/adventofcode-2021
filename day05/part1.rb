lines = File.read('input').strip.split(?\n).map do |line|
  line.split(' -> ').map { |p| p.split(?,).map(&:to_i) }
end

def expand(from, to)
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

valves = lines.select { |l| straight?(*l) }. map { |l| expand(*l) }.flatten(1)

puts valves.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.values.select { |v| v > 1 }.size
