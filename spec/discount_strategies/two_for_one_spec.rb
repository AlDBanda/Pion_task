# spec/discount_strategies/two_for_one_spec.rb
require 'spec_helper'
RSpec.describe TwoForOneStrategy do
  subject(:strategy) { described_class.new }

  describe '#calculate' do
    it 'applies discount for even numbers' do
      expect(strategy.calculate(10, 2)).to eq(10)
    end

    it 'charges full price for odd numbers' do
      expect(strategy.calculate(10, 3)).to eq(30)
    end
  end
end
