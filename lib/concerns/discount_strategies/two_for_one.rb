# lib/concerns/discount_strategies/two_for_one.rb

class TwoForOneStrategy
  def calculate(price, count)
    if count.even?
      price * (count / 2)
    else
      price * count
    end
  end
end
