# lib/concerns/discount_strategies/two_for_one.rb
require_relative 'base_strategy'
class TwoForOneStrategy
  def calculate(price, count)
    if count.even?
      price * (count / 2)
    else
      price * count
    end
  end
end
