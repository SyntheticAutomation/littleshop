require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'Validations' do
    it {should belong_to(:user)}
    it {should have_many(:order_items)}
    it {should have_many(:orders).through(:order_items)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:inventory_qty)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:user)}
  end
  describe 'instance methods' do
    describe '.average_fulfillment_time' do
      it 'should return average fulfillment time for specific item' do
        merchant_1 = create(:user, role: 1)
        item_1 = create(:item, user: merchant_1)
        binding.pry

      end
    end
  end
end
