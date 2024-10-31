# lib/concerns/basket_manager.rb
class BasketManager
  def initialize
    @basket = []
  end

  def add_item(item)
    @basket << item.to_sym
  end

  def items
    @basket.dup # Use dup to return a copy instead of the original array
  end
end
