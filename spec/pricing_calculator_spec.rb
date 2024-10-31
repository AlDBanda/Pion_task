# spec/pricing_calculator_spec.rb
require 'spec_helper'

RSpec.describe PricingCalculator do
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

  subject(:calculator) { described_class.new(pricing_rules) }

  describe '#calculate_total' do
    context 'with no discounts' do
      it 'calculates regular price for single items' do
        expect(calculator.calculate_total([:orange])).to eq(20)
      end

      it 'calculates regular price for multiple items' do
        expect(calculator.calculate_total(%i[orange orange])).to eq(40)
      end
    end

    context 'with two for one discount' do
      it 'applies discount for apples' do
        expect(calculator.calculate_total(%i[apple apple])).to eq(10)
      end

      it 'applies discount for pears' do
        expect(calculator.calculate_total(%i[pear pear])).to eq(15)
      end

      it 'handles odd numbers correctly' do
        expect(calculator.calculate_total(%i[apple apple apple])).to eq(30)
      end
    end

    context 'with half price discount' do
      it 'applies discount for bananas' do
        expect(calculator.calculate_total([:banana])).to eq(15)
      end

      it 'applies discount for multiple bananas' do
        expect(calculator.calculate_total(%i[banana banana])).to eq(30)
      end
    end

    context 'with first item half price' do
      it 'applies discount for first pineapple' do
        expect(calculator.calculate_total([:pineapple])).to eq(50)
      end

      it 'charges full price for additional pineapples' do
        expect(calculator.calculate_total(%i[pineapple pineapple])).to eq(150)
      end
    end

    context 'with buy three get one free' do
      it 'applies discount for four mangos' do
        expect(calculator.calculate_total(%i[mango mango mango mango])).to eq(600)
      end

      it 'charges full price for incomplete sets' do
        expect(calculator.calculate_total(%i[mango mango mango])).to eq(600)
      end
    end

    context 'with invalid items' do
      it 'raises error for unknown items' do
        expect { calculator.calculate_total([:invalid]) }
          .to raise_error(InvalidItemError, 'Item not found: invalid')
      end
    end

    context 'with mixed basket' do
      it 'applies multiple discounts correctly' do
        basket = %i[apple apple banana orange pineapple]
        expect(calculator.calculate_total(basket)).to eq(95) # 10 + 15 + 20 + 50
      end
    end
  end
end
