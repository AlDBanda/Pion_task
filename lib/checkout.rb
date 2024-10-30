require_relative 'basket_manager'
require_relative 'pricing_calculator'

class Checkout
  attr_reader :basket_manager, :pricing_calculator

  def initialize(pricing_rules)
    @basket_manager = BasketManager.new
    @pricing_calculator = PricingCalculator.new(pricing_rules)
  end

  def scan(item)
    basket_manager.add_item(item)
  end

  def total
    pricing_calculator.calculate_total(basket_manager.items)
  end
end
