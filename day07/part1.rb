input = File.read('input').strip.split(?,).map(&:to_i)

range = (input.min..input.max)

fuels = range.to_a.map do |position|
  input.inject(0) { |fuel, crab| fuel += (crab - position).abs }
end

puts fuels.min
