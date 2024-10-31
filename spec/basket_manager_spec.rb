# spec/basket_manager_spec.rb
RSpec.describe BasketManager do
  let(:manager) { BasketManager.new }

  it 'adds items to basket' do
    manager.add_item(:apple)
    expect(manager.items).to eq([:apple])
  end
end

# spec/pricing_calculator_spec.rb
RSpec.describe PricingCalculator do
  let(:rules) { { apple: 10, banana: 30 } }
  let(:calculator) { PricingCalculator.new(rules) }

  describe '#calculate_total' do
    it 'handles two for one on apples' do
      expect(calculator.calculate_total(%i[apple apple])).to eq(10)
    end

    it 'handles half price bananas' do
      expect(calculator.calculate_total([:banana])).to eq(15)
    end

    it 'raises error for invalid items' do
      expect { calculator.calculate_total([:invalid]) }.to raise_error(InvalidItemError)
    end
  end
end
