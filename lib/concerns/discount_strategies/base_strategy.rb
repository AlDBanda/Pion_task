# lib/concerns/discount_strategies/base_strategy.rb
require_relative 'base_strategy'

class BaseDiscountStrategy
  def calculate(price, count)
    price * count
  end
end
