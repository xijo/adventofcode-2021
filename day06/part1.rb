require 'fortschritt'
fishes = File.read('input').strip.split(?,).map(&:to_i)

def simulate_day(fishes)
  new_fishes = []
  fishes.map do |f|
    if f.zero?
      new_fishes << 8
      6
    else
      f - 1
    end
  end + new_fishes
end

80.times.with_fortschritt.each do |i|
  fishes = simulate_day(fishes.fortschritt)
end

puts fishes.size
