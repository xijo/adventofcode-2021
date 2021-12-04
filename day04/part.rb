require 'active_support/all'
require 'pastel'
require 'byebug'

rows = File.read('input').strip.split(?\n).split { |r| r == '' }

class Board
  def initialize(numbers)
    @numbers = numbers.map(&:split).map { |r| r.map(&:to_i) }
    @marked = []
    @solved = false
  end

  def mark(number)
    @marked << number
    if (@numbers + @numbers.transpose).any? { |row| (@marked & row).size == 5 }
      @solved = true
      @solving_number = number
    end
  end

  def score
    (@numbers.flatten - @marked).sum * @solving_number
  end

  def solved?
    @solved
  end

  def print
    puts
    puts "Board is #{@solved ? Pastel.new.green("solved (score #{score})") : Pastel.new.red('unsolved')}"
    @numbers.each do |row|
      puts row.map { |n| Pastel.new.decorate(n.to_s.rjust(4), @marked.include?(n) ? :green : :white) }.join(" ")
    end
    puts
  end
end

numbers = rows.shift.first.split(?,).map(&:to_i)
boards = rows.map { |r| Board.new(r) }

# PART 1
puts "First solved board:"
numbers.each do |number|
  boards.each do |board|
    board.mark(number)
    board.print if board.solved?
  end
  break if boards.any?(&:solved?)
end

# PART 2
boards = rows.map { |r| Board.new(r) }

puts "Last solved board:"
numbers.each do |number|
  if boards.size > 1
    boards.delete_if do |board|
      board.mark(number)
      board.solved?
    end
  else
    boards.last.mark(number)
    if boards.last.solved?
      boards.last.print
      return
    end
  end
end
