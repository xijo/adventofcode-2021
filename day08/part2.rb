input = File.read('input').strip.split(?\n)

def decipher_output(line)
  parts = line.split(?|).join.split(/\s+/).map { |v| v.split('').sort }

  mapping = {
    1 => parts.select { |p| p.size == 2 }.first,
    4 => parts.select { |p| p.size == 4 }.first,
    7 => parts.select { |p| p.size == 3 }.first,
    8 => parts.select { |p| p.size == 7 }.first,
  }

  # 6 has 6 parts and does not include 1
  mapping[6] = parts.select { |p| p.size == 6 && (p & mapping[1]).size == 1 }.first

  # 9 has 6 parts, includes 4
  mapping[9] = parts.select { |p| p.size == 6 && (p & mapping[4]).size == mapping[4].size }.first

  # 0 is the last one with 6 parts
  mapping[0] = parts.select { |p| p.size == 6 && p != mapping[6] && p != mapping[9] }.first

  # 3 has 5 parts, is completely included in 9 and includes 1
  mapping[3] = parts.select { |p| p.size == 5 && (p & mapping[9]).size == 5 && (p & mapping[1]).size == mapping[1].size }.first

  # 5 has 5 parts, is included in 9 and 6
  mapping[5] = parts.select { |p| p.size == 5 && (p & mapping[9]).size == 5 && (p & mapping[6]).size == 5 }.first

  # 2 is the last one with 5 parts
  mapping[2] = parts.select { |p| p.size == 5 && p != mapping[5] && p != mapping[3] }.first

  parts.map(&:join).join(' ').gsub(/[a-z]+/, **mapping.transform_values(&:join).invert).scan(/\d/).last(4).join.to_i
end

puts input.map { |l| decipher_output(l) }.sum
