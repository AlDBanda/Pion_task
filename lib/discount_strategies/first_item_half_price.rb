# lib/discount_strategies/first_item_half_price.rb
class FirstItemHalfPriceStrategy
  def calculate(price, count)
    return price / 2 if count == 1
    (price / 2) + (price * (count - 1))
  end
end

# lib/discount_strategies/buy_three_get_one_free.rb
class BuyThreeGetOneFreeStrategy
  def calculate(price, count)
    if (count % 4).zero?
      price * (count - (count / 4))
    else
      price * count
    end
  end
end