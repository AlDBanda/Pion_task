# spec/discount_strategies/first_item_half_price_spec.rb
require 'spec_helper'
require_relative '../../lib/concerns/discount_strategies/first_item_half_price'
RSpec.describe FirstItemHalfPriceStrategy do
  subject(:strategy) { described_class.new }

  describe '#calculate' do
    it 'applies half price for single item' do
      expect(strategy.calculate(100, 1)).to eq(50)
    end

    it 'charges full price for additional items' do
      expect(strategy.calculate(100, 2)).to eq(150)
    end
  end
end
