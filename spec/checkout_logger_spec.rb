# spec/checkout_logger_spec.rb
RSpec.describe CheckoutLogger do
  it 'creates a logger instance' do
    expect(CheckoutLogger.logger).to be_instance_of(Logger)
  end
end
