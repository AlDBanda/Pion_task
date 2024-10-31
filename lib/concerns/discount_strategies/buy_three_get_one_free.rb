# lib/concerns/discount_strategies/buy_three_get_one_free.rb
require_relative 'base_strategy'

class BuyThreeGetOneFreeStrategy < BaseDiscountStrategy
  def calculate(price, count)
    sets = count / 4
    remaining = count % 4
    (sets * 3 * price) + (remaining * price)
  end
end