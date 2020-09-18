require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品が上手くいかない時'
    it '画像ファイルがなければ登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がなければ登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品説明がなければ登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it '値段がなければ登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '値段は半角でなければ登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
    it '値段が¥300未満、もしくは¥9999999より大きいと登録できない' do
      @item.price = '100 || 10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'カテゴリーがなければ登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it '商品の状態がなければ登録できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('State must be other than 1')
    end
    it '配送料の負担の選択がなければ登録できない' do
      @item.delivery_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery charge must be other than 1')
    end
    it '発送元の地域がなければ登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
    end
    it '発送までの日数が存在すれば登録できる' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
    end
    context '新規登録が上手くいくとき'
    it 'image,name,description,price,category,state,delivery_change,shipping_area,shipping_dayが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
end
