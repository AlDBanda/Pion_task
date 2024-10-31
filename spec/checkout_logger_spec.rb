# spec/checkout_logger_spec.rb
require 'spec_helper'
require 'logger'

RSpec.describe CheckoutLogger do
  describe '.logger' do
    it 'creates a logger instance' do
      expect(CheckoutLogger.logger).to be_instance_of(Logger)
    end

    it 'returns the same logger instance' do
      logger1 = CheckoutLogger.logger
      logger2 = CheckoutLogger.logger
      expect(logger1).to eq(logger2)
    end
  end
end
