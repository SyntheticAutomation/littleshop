require 'rails_helper'

describe 'when any kind of user visits /items' do
  it 'should see all items except disabled ones' do
    merchant_1 = Merchant.create(name: "Merchant 1", city: "City 1", state: "State 1")
    merchant_2 = Merchant.create(name: "Merchant 2", city: "City 2", state: "State 2")
    item_1 = merchant_1.items.create(name: "item 1", description: "glitter 1", image_url: "https://bit.ly/2rGOSMR", inventory_qty: 7, price: "5", status: true)
    item_2 = merchant_1.items.create(name: "item 2", description: "glitter 2", image_url: "https://bit.ly/2rGOSMR", inventory_qty: 9, price: "6", status: true)
    item_3 = merchant_2.items.create(name: "item 3", description: "glitter 3", image_url: "https://bit.ly/2rGOSMR", inventory_qty: 11, price: "7", status: true)
    item_4 = merchant_2.items.create(name: "item 4", description: "glitter 4", image_url: "https://bit.ly/2rGOSMR", inventory_qty: 12, price: "9", status: false)

    visit items_path

    expect(page).to_not have_content(item_4.name)

    within "#item-#{item_1.id}" do
      expect(page).to have_content(item_1.name)
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content("Quantity: #{item_1.inventory_qty}")
      expect(page).to have_content("Price: $#{item_1.price}")
      expect(page).to_not have_content(merchant_2.name)
    end

    within "#item-#{item_2.id}" do
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(merchant_1.name)
      expect(page).to have_content("Quantity: #{item_2.inventory_qty}")
      expect(page).to have_content("Price: $#{item_2.price}")
      expect(page).to_not have_content(merchant_2.name)
    end

    within "#item-#{item_3.id}" do
      expect(page).to have_content(item_3.name)
      expect(page).to have_content(merchant_2.name)
      expect(page).to have_content("Quantity: #{item_3.inventory_qty}")
      expect(page).to have_content("Price: $#{item_3.price}")
      expect(page).to_not have_content(merchant_1.name)
    end
  end
end
