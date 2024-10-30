# spec/pricing_calculator_spec.rb
it 'raises error for invalid item' do
  expect { calculator.calculate_total([:invalid_item]) }.to raise_error(InvalidItemError)
end
