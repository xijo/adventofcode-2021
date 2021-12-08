input = File.read('input').strip.split(?,).map(&:to_i)

range = (input.min..input.max)

fuels = range.to_a.map do |position|
  input.inject(0) do |fuel, crab|
    distance = (crab - position).abs
    # https://en.wikipedia.org/wiki/Triangular_number
    fuel += (distance * (distance + 1)) / 2
  end
end

puts fuels.min
