# frozen_string_literal: true

class TwoForOneStrategy
  def calculate(price, count)
    if count.even?
      price * (count / 2)
    else
      price * count
    end
  end
end
