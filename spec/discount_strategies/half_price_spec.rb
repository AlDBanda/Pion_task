# spec/discount_strategies/half_price_spec.rb
require 'spec_helper'
RSpec.describe HalfPriceStrategy do
  subject(:strategy) { described_class.new }

  describe '#calculate' do
    it 'charges half price' do
      expect(strategy.calculate(10, 1)).to eq(5)
      expect(strategy.calculate(10, 2)).to eq(10)
    end
  end
end
