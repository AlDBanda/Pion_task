# lib/discount_strategies/first_item_half_price.rb
class FirstItemHalfPriceStrategy
  def calculate(price, count)
    return price / 2 if count == 1
    (price / 2) + (price * (count - 1))
  end
end

