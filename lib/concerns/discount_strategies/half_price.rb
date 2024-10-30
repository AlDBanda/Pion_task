# frozen_string_literal: true

class HalfPriceStrategy
  def calculate(price, count)
    (price / 2) * count
  end
end
