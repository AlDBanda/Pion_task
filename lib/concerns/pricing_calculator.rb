# lib/pricing_calculator.rb
require_relative 'discount_strategies/two_for_one'
require_relative 'discount_strategies/half_price'

class PricingCalculator
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @strategies = {
      apple: TwoForOneStrategy.new,
      pear: TwoForOneStrategy.new,
      banana: HalfPriceStrategy.new
    }
  end

  def calculate_total(basket)
    basket.tally.sum do |item, count|
      calculate_item_price(item, count)
    end
  end

  private

  def calculate_item_price(item, count)
    price = @pricing_rules.fetch(item)
    strategy = @strategies[item]
    
    if strategy
      strategy.calculate(price, count)
    else
      price * count
    end
  end
end