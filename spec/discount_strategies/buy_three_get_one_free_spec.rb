# spec/discount_strategies/buy_three_get_one_free_spec.rb
require 'spec_helper'
RSpec.describe BuyThreeGetOneFreeStrategy do
  subject(:strategy) { described_class.new }

  describe '#calculate' do
    it 'applies discount when buying four' do
      expect(strategy.calculate(200, 4)).to eq(600)
    end

    it 'charges full price for incomplete sets' do
      expect(strategy.calculate(200, 3)).to eq(600)
    end
  end
end
