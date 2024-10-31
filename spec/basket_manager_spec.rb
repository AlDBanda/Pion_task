# spec/basket_manager_spec.rb
require 'spec_helper'

RSpec.describe BasketManager do
  subject(:basket_manager) { described_class.new }

  describe '#add_item' do
    it 'adds an item to the basket' do
      basket_manager.add_item(:apple)
      expect(basket_manager.items).to eq([:apple])
    end

    it 'converts string items to symbols' do
      basket_manager.add_item('apple')
      expect(basket_manager.items).to eq([:apple])
    end

    it 'maintains order of added items' do
      basket_manager.add_item(:apple)
      basket_manager.add_item(:orange)
      basket_manager.add_item(:apple)
      expect(basket_manager.items).to eq(%i[apple orange apple])
    end
  end

  describe '#items' do
    it 'returns an empty array for new basket' do
      expect(basket_manager.items).to be_empty
    end

    it 'returns a copy of the basket' do
      basket_manager.add_item(:apple)
      items = basket_manager.items
      items << :orange
      expect(basket_manager.items).to eq([:apple])
    end
  end
end
