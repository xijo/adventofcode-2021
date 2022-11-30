input = File.read(ARGV[0] || 'example').strip.split(?\n)

paths = {}

input.each do |line|
  from, to = line.split(?-)
  paths[from] ||= []
  paths[from] << to
  if from == from.capitalize
    paths[to] ||= []
    paths[to] << from
  end
end

def count_paths(paths, position, count)
  puts paths[position].inspect
end

puts count_paths(paths, 'start', 0)
