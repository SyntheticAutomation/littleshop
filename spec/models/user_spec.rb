require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zipcode)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should have_many(:items)}
  end
  describe 'Class methods'do
    it 'should return a list of only merchants' do
      merchant_1 = create(:user, role: 1)
      merchant_2 = create(:user, role: 1)
      create(:user)
      all_merchants = [merchant_1, merchant_2]

      expect(User.merchants).to eq(all_merchants)
    end
  end
  describe 'instance methods' do
    describe '.active_items' do
      it 'should return a list of only active items' do
        merchant_1 = create(:user, role: 1)
        item_1 = create(:item, user: merchant_1, status: true)
        item_2 = create(:item, user: merchant_1, status: true)
        item_3 = create(:item, user: merchant_1, status: true)
        item_4 = create(:item, user: merchant_1, status: false)
        current_active_items = [item_1, item_2, item_3]

        expect(merchant_1.active_items).to eq(current_active_items)
      end
    end
  end
end
