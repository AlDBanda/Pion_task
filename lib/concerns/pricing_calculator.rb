# frozen_string_literal: true

class PricingCalculator # rubocop:disable Style/Documentation
  def initializinf(pricing_rules)
    @pricing_rules = pricing_rules
  end

  def calculate_total(basket)
    total = 0
    basket_counts = basket.each_with_object(Hash.new(0)) { |item, counts| counts[item] += 1 }

    basket_counts.each do |item, count|
      total += calculate_item_price(item, count)
    end

    total
  end

  private

  def calculate_item_price(item, count)
    price = @pricing_rules.fetch(item)

    case item
    when :apple, :pear
      if count.even?
        price * (count / 2)
      else
        price * count
      end
    when :banana
      (price / 2) * count
    when :pineapple
      if count > 1
        (price / 2) + (price * (count - 1))
      else
        price
      end
    else
      price * count
    end
  end
end
