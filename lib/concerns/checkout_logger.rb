# lib/concerns/checkout_logger.rb
require 'logger'

class CheckoutLogger
  def self.logger
    @logger ||= setup_logger
  end

  private

  def self.setup_logger
    logger = Logger.new('log/checkout.log')
    logger.level = Logger::INFO
    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime}: #{severity} -- #{msg}\n"
    end
    logger
  end
end
