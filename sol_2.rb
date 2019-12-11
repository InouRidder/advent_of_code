class IntCoder
  FUNC_MAP = {
    1 => 'one',
    2 => 'two'
  }
  def initialize(intmap)
    @intmap = intmap
  end

  def call
    sets = @intmap.each_slice(4)
    sets.each do |set|
      break if set[0] == 99
      send(find_func(set), set)
    end
    @intmap
  end

  private

  def find_func(set)
    FUNC_MAP[set[0]]
  end

  def one(set)
    @intmap[set[3]] = @intmap[set[1]] + @intmap[set[2]]
  end

  def two(set)
    @intmap[set[3]] = @intmap[set[1]] * @intmap[set[2]]
  end
end
# exptected = 19690720

layout = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,9,19,23,1,23,5,27,2,27,10,31,1,6,31,35,1,6,35,39,2,9,39,43,1,6,43,47,1,47,5,51,1,51,13,55,1,55,13,59,1,59,5,63,2,63,6,67,1,5,67,71,1,71,13,75,1,10,75,79,2,79,6,83,2,9,83,87,1,5,87,91,1,91,5,95,2,9,95,99,1,6,99,103,1,9,103,107,2,9,107,111,1,111,6,115,2,9,115,119,1,119,6,123,1,123,9,127,2,127,13,131,1,131,9,135,1,10,135,139,2,139,10,143,1,143,5,147,2,147,6,151,1,151,5,155,1,2,155,159,1,6,159,0,99,2,0,14,0]

# DAY 2 PART TWO

@found = false
99.times do |i|
  final = layout.dup
  final[1] = i + 1
  99.times do |b|
    level_two = final.dup
    level_two[2] = b + 1
    @found = true if IntCoder.new(level_two).call[0] == 19690720
    if @found
      p "1: #{final[1]}"
      p "2: #{level_two[2]}"
      break
    end
  end
end

# puts "FINAL 1: #{final[1]} :: FINAL 2:: #{final[2]}"

# Day 2, part 1 tests
# test_one = [1,0,0,0,99]
# result = IntCoder.new(test_one).call
# puts "#{result[0] == 2}"

# test_two = [2,3,0,3,99]  # 2,3,0,6,99
# result = IntCoder.new(test_two).call
# puts "#{result[3] == 6}"

# test_two = [2,4,4,5,99,0]  # 2,3,0,6,99
# result = IntCoder.new(test_two).call
# puts "#{result[-1] == 9801}"

# test_two = [1,1,1,4,99,5,6,0,99]  # 30,1,1,4,2,5,6,0,99.
# result = IntCoder.new(test_two).call
# p result
# puts "#{result[0] == 30}"
# # 1,1,1,4, 99,5,6,0, 99 becomes 30,1,1,4,2,5,6,0,99.

noun = 40
verb = 19
