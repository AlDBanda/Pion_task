# lib/concerns/checkout_error.rb
class CheckoutError < StandardError; end
class InvalidItemError < CheckoutError; end
class InvalidPriceError < CheckoutError; end
