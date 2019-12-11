class PWCounter
  # CONSEC_SAME = /(11|22|33|44|55|66|77|88|99|00)/ # part 1
  CONSEC_SAME = /(([^1]|^)11([^1]|$)|([^2]|^)22([^2]|$)|([^3]|^)33([^3]|$)|([^4]|^)44([^4]|$)|([^5]|^)55([^5]|$)|([^6]|^)66([^6]|$)|([^7]|^)77([^7]|$)|([^8]|^)88([^8]|$)|([^9]|^)99([^9]|$)|([^0]|^)00([^0]|$))/ # part 2
  attr_accessor :r_start, :r_end, :range
  def initialize(range)
    @range = range
    split
    @count = 0
  end

  def call
    until r_start > r_end
      t_test = r_start.to_s.split('').sort.join('')
      if match_and_equal_sort?(t_test, r_start)
        @count += 1
      end
      self.r_start += 1
    end
    return @count
  end

  private

  def match_and_equal_sort?(t_test, r_start)
    t_test == r_start.to_s && CONSEC_SAME.match?(t_test)
  end

  def split
    self.r_start, self.r_end = range.split('-').map(&:to_i)
  end
end

puts PWCounter.new('273025-767253').call
