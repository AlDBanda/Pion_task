# spec/integration/checkout_integration_spec.rb
RSpec.describe 'Checkout Integration' do
  let(:checkout) { Checkout.new(pricing_rules) }
  let(:pricing_rules) do
    {
      apple: 10,
      orange: 20,
      banana: 30
    }
  end

  describe 'shopping basket' do
    it 'calculates total for simple basket' do
      # Add items
      checkout.scan(:apple)
      checkout.scan(:orange)
      checkout.scan(:banana)

      # Total: apple(10) + orange(20) + banana(15 half price) = 45
      expect(checkout.total).to eq(45)
    end

    it 'applies two for one discount' do
      # Add two apples
      checkout.scan(:apple)
      checkout.scan(:apple)

      expect(checkout.total).to eq(10) # Two for one price
    end
  end
end
