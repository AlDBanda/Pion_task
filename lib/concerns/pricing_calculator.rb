# lib/concerns/pricing_calculator.rb
require_relative 'checkout_logger'
require_relative 'checkout_error'
require_relative 'discount_strategies/base_strategy'
require_relative 'discount_strategies/two_for_one'
require_relative 'discount_strategies/half_price'
require_relative 'discount_strategies/first_item_half_price'
require_relative 'discount_strategies/buy_three_get_one_free'

class PricingCalculator
  def initialize(pricing_rules)
    validate_pricing_rules(pricing_rules)
    @pricing_rules = pricing_rules
    @strategies = {
      apple: TwoForOneStrategy.new,
      pear: TwoForOneStrategy.new,
      banana: HalfPriceStrategy.new,
      pineapple: FirstItemHalfPriceStrategy.new,
      mango: BuyThreeGetOneFreeStrategy.new
    }
    CheckoutLogger.logger.info("PricingCalculator initialized with rules: #{pricing_rules}")
  end

  def calculate_total(basket)
    CheckoutLogger.logger.info("Calculating total for basket: #{basket}")
    total = basket.tally.sum do |item, count|
      subtotal = calculate_item_price(item, count)
      CheckoutLogger.logger.info("Subtotal for #{item} x#{count}: #{subtotal}")
      subtotal
    end
    CheckoutLogger.logger.info("Final total: #{total}")
    total
  end

  private

  def validate_pricing_rules(rules)
    raise InvalidPriceError, 'Pricing rules cannot be empty' if rules.nil? || rules.empty?

    rules.each do |item, price|
      raise InvalidPriceError, "Invalid price for #{item}: #{price}" unless price.is_a?(Numeric) && price > 0
    end
  end

  def calculate_item_price(item, count)
    unless @pricing_rules.key?(item)
      CheckoutLogger.logger.error("Invalid item attempted: #{item}")
      raise InvalidItemError, "Item not found: #{item}"
    end

    price = @pricing_rules.fetch(item)
    strategy = @strategies[item] || BaseDiscountStrategy.new
    strategy.calculate(price, count)
  end
end
