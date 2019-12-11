require 'pry'

numbers = %w[
  118997
  63756
  124972
  141795
  111429
  53536
  50522
  143985
  62669
  77518
  60164
  72698
  123145
  57693
  87138
  82831
  53289
  60110
  115660
  51217
  117781
  81556
  103963
  89000
  109330
  100487
  136562
  145020
  140554
  102425
  93333
  75265
  55764
  70093
  73800
  81349
  141055
  56441
  141696
  89544
  106152
  98674
  100882
  137932
  88008
  149027
  92767
  113740
  79971
  85741
  126630
  75626
  125042
  69237
  147069
  60786
  63751
  144363
  81873
  107230
  90789
  81655
  144004
  74536
  126675
  147470
  123359
  68081
  136423
  94629
  58263
  122420
  143933
  148528
  129120
  78391
  74289
  106795
  143640
  59108
  64462
  78216
  56113
  64708
  82372
  115231
  74229
  130979
  83590
  76666
  93156
  138450
  71077
  128048
  65476
  85804
  145692
  106836
  70016
  113158
]

class FuelCalc
  def initialize
    @total = 0
  end

  def fuel_req(num)
    req = (num / 3).floor - 2
    @total += req
    if req >= 9
      fuel_req(req)
    else
      @total
    end
  end
end

total = numbers.map { |i| FuelCalc.new.fuel_req(i.to_i) }.sum
p total
# For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2.
# For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.
# For a mass of 1969, the fuel required is 654.
# For a mass of 100756, the fuel required is 33583.
