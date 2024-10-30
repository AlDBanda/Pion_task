# frozen_string_literal: true

class BasketManager # rubocop:disable Style/Documentation
  def initialize
    @basket = []
  end

  def add_item(item)
    @basket << item.to_sym
  end

  def items
    @basket.dup
  end
end
