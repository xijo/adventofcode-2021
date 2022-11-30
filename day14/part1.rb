input = File.read('input').strip.split(?\n)

template = input[0]
rules = input[2..-1].inject({}) do |h, line|
  pair, c = line.split(' -> ')
  h[pair] = c
  h
end

def polymerize(template, rules)
  parts = template.split('')
  result = parts.dup
  insert_count = 0

  parts.each_with_index do |part, index|
    element = rules[[part, parts[index+1]].join] or next
    result.insert(index + insert_count + 1, element)
    insert_count += 1
  end
  result.join
end

def caliper(template)
  counts = template.split('').tally.invert
  counts.max.first - counts.min.first
end

10.times do |step|
  template = polymerize(template, rules)
end

puts caliper(template)
