require 'rails_helper'
RSpec.describe OrderItemPurchase, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_item_purchase = FactoryBot.build(:order_item_purchase)
    @order_item_purchase.item_id = @item.id
    @order_item_purchase.user_id = @user.id
    sleep 1
  end

  describe '商品購入' do
    context '商品購入が上手くいかない時'
    it '郵便番号が空だと購入できない' do
      @order_item_purchase.postal_code = ''
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号-がないと購入できない' do
      @order_item_purchase.postal_code = '1234567'
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include('Postal code include -')
    end
    it '都道府県がなければ購入できない' do
      @order_item_purchase.prefecture_id = ''
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include('Prefecture is not a number')
    end
    it '都道府県が---を示すid値（1）だと購入できない' do
      @order_item_purchase.prefecture_id = '1'
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it '市区町村がなければ購入できない' do
      @order_item_purchase.city = ''
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include("City can't be blank")
    end
    it '番地がなければ購入できない' do
      @order_item_purchase.house_number = ''
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号がなければ購入できない' do
      @order_item_purchase.phone_number = ''
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号に-があると購入できない' do
      @order_item_purchase.phone_number = '080-9999-222'
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include("Phone number include numbers")
    end
    it '電話番号が12桁以上だと購入できない' do
      @order_item_purchase.phone_number = '123456789012'
      @order_item_purchase.valid?
      expect(@order_item_purchase.errors.full_messages).to include("Phone number include numbers")
    end

    context '商品購入が上手くいく時'
    it 'postal_code,prefecture_id,city,house_number,phone_numberが存在すれば購入できる' do
      expect(@order_item_purchase).to be_valid
    end
  end
end
