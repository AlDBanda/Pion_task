# lib/concerns/pricing_calculator.rb
class PricingCalculator
  def initialize(pricing_rules)
    validate_pricing_rules(pricing_rules)
    @pricing_rules = pricing_rules
  end

  private

  def validate_pricing_rules(rules)
    raise InvalidPriceError, 'Pricing rules cannot be empty' if rules.nil? || rules.empty?

    rules.each do |item, price|
      raise InvalidPriceError, "Invalid price for #{item}: #{price}" unless price.is_a?(Numeric) && price > 0
    end
  end

  private

  def count_items(basket)
    counts = Hash.new(0)
    basket.each { |item| counts[item] += 1 }
    counts
  end

  def get_price_with_discount(item, count)
    raise InvalidItemError, "Item not found: #{item}" unless @pricing_rules.key?(item)

    base_price = @pricing_rules[item]

    case item
    when :apple, :pear
      apply_two_for_one(base_price, count)
    when :banana
      apply_half_price(base_price, count)
    when :pineapple
      apply_first_item_half_price(base_price, count)
    when :mango
      apply_buy_three_get_one_free(base_price, count)
    else
      base_price * count
    end
  end

  def apply_two_for_one(price, count)
    pairs = count / 2
    remaining = count % 2
    (pairs * price) + (remaining * price)
  end

  def apply_half_price(price, count)
    (price / 2) * count
  end

  def apply_first_item_half_price(price, count)
    first_item = price / 2
    rest_items = price * (count - 1)
    first_item + rest_items
  end

  def apply_buy_three_get_one_free(price, count)
    sets = count / 4
    remaining = count % 4
    (sets * 3 * price) + (remaining * price)
  end
end
