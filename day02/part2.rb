require 'fileutils'

commands = File.read('input').strip.split(?\n)

aim = 0
position = [0, 0]

commands.each do |command|
  direction, offset = command.split
  offset = offset.to_i
  case direction
  when 'forward'
    position[0] += offset
    position[1] += (offset * aim)
  when 'up'
    aim -= offset
  when 'down'
    aim += offset
  end
end

puts position[0] * position[1]
