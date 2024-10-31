# lib/checkout.rb
require_relative 'concerns/basket_manager'
require_relative 'concerns/pricing_calculator'
require_relative 'concerns/checkout_logger'

class Checkout
  def initialize(pricing_rules)
    @basket_manager = BasketManager.new
    @pricing_calculator = PricingCalculator.new(pricing_rules)
    CheckoutLogger.logger.info("Checkout initialized with rules: #{pricing_rules}")
  end

  def scan(item)
    @basket_manager.add_item(item)
    CheckoutLogger.logger.info("Item scanned: #{item}")
  end

  def total
    total = @pricing_calculator.calculate_total(@basket_manager.items)
    CheckoutLogger.logger.info("Total calculated: #{total}")
    total
  end
end
