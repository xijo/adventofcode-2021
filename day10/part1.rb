lines = File.read('example').strip.split(?\n)

points = { ?) => 3, ?] => 57, ?} => 1197, ?> => 25137 }
closings = { ?( => ?), ?[ => ?], ?{ => ?}, ?< => ?> }

def check(chunk)
  start = chunk[0]

  if closings.keys.include?(chunk[1])

end


lines.select { |l| l[-1] != closings[l[0]] }.each { |l| puts l }
