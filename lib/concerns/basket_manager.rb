# lib/concerns/basket_manager.rb
class BasketManager
  def initialize
    @basket = []
  end

  def add_item(item)
    @basket << item.to_sym
  end

  def items
    @basket # Returns array of items
  end
end

# lib/checkout.rb
class Checkout
  def initialize(pricing_rules)
    @basket = BasketManager.new
    @calculator = PricingCalculator.new(pricing_rules)
  end

  def scan(item)
    @basket.add_item(item)
  end

  def total
    @calculator.calculate_total(@basket.items)
  end
end

# spec/checkout_spec.rb
RSpec.describe Checkout do
  let(:checkout) { Checkout.new(pricing_rules) }
  let(:pricing_rules) do
    {
      apple: 10,
      orange: 20,
      pear: 15,
      banana: 30,
      pineapple: 100,
      mango: 200
    }
  end

  describe '#total' do
    it 'calculates the total for two apples' do
      2.times { checkout.scan(:apple) }
      expect(checkout.total).to eq(10) # Two for one discount
    end

    it 'calculates the total for one banana' do
      checkout.scan(:banana)
      expect(checkout.total).to eq(15) # Half price
    end
  end
end
