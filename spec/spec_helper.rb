require 'spec_helper'
require 'concerns/basket_manager'
require 'concerns/pricing_calculator'
require 'checkout'

RSpec.describe Checkout do
  let(:basket_manager) { instance_double(BasketManager) }
  let(:pricing_calculator) { instance_double(PricingCalculator) }

  subject(:checkout) { Checkout.new(pricing_rules) }

  let(:pricing_rules) {
    {
      apple: 10,
      orange: 20,
      pear: 15,
      banana: 30,
      pineapple: 100,
      mango: 200
    }
  }

  before do
    allow(BasketManager).to receive(:new).and_return(basket_manager)
    allow(PricingCalculator).to receive(:new).with(pricing_rules).and_return(pricing_calculator)
  end

  describe '#total' do
    it 'calculates the total price using the PricingCalculator' do
      expect(basket_manager).to receive(:items).and_return([:apple, :orange])
      expect(pricing_calculator).to receive(:calculate_total).with([:apple, :orange]).and_return(30)
      expect(checkout.total).to eq(30)
    end
  end
end