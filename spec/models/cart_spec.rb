require 'rails_helper'


  describe 'instance methods' do
    it '.add_item should add an item' do
      merchant = create(:merchant)
      item_1 = create(:item, user: merchant)
      item_2 = create(:item, user: merchant)
      cart = Cart.new(Hash.new(0))
      cart.add_item(item_1)
      cart.add_item(item_1)
      cart.add_item(item_1)
      cart.add_item(item_2)

      expect(cart.contents).to eq({"#{item_1.id}" => 3, "#{item_2.id}" => 1})
    end

    it '.amount should return amount for each item' do
      cart = Cart.new({"1" => 2, "15" => 30})

      expect(cart.amount(15)).to eq(30)
      expect(cart.amount(1)).to eq(2)
      expect(cart.amount(20)).to eq(0)
    end

    it '.total_count should return total count of all items' do
      cart = Cart.new({"1" => 2, "15" => 30})

      expect(cart.total_count).to eq(32)
    end

    it '.all_items should return all item objects in cart' do
      merchant = create(:merchant)
      item_1 = create(:item, user: merchant)
      item_2 = create(:item, user: merchant)
      cart = Cart.new(Hash.new(0))
      cart.add_item(item_1)
      cart.add_item(item_1)
      cart.add_item(item_1)
      cart.add_item(item_2)
      all_items_in_cart = ({item_1.id.to_s => 3, item_2.id.to_s => 1})

      expect(cart.all_items).to eq(all_items_in_cart)
    end

  end
