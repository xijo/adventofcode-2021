require 'fileutils'

commands = File.read('input').strip.split(?\n)

position = [0, 0]

commands.each do |command|
  direction, offset = command.split
  offset = offset.to_i
  case direction
  when 'forward'
    position[0] += offset
  when 'up'
    position[1] -= offset
  when 'down'
    position[1] += offset
  end
end

puts position[0] * position[1]
