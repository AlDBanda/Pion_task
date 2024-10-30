# spec/pricing_calculator_spec.rb
it 'raises error for invalid item' do
  expect { calculator.calculate_total([:invalid_item]) }.to raise_error(InvalidItemError)
end

describe 'validation' do
  it 'rejects nil pricing rules' do
    expect { PricingCalculator.new(nil) }.to raise_error(InvalidPriceError)
  end

  it 'rejects negative prices' do
    expect do
      PricingCalculator.new(apple: -10)
    end.to raise_error(InvalidPriceError)
  end
end
