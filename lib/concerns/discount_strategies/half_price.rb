# lib/concerns/discount_strategies/half_price.rb

class HalfPriceStrategy
  def calculate(price, count)
    (price / 2) * count
  end
end
