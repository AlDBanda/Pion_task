# lib/concerns/discount_strategies/half_price.rb
require_relative 'base_strategy'
class HalfPriceStrategy
  def calculate(price, count)
    (price / 2) * count
  end
end
