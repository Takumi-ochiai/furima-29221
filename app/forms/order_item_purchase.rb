class OrderItemPurchase
  include ActiveModel::Model
  # attr_accessor内はテーブル関係なく保存したいカラム一式
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  # orderモデルから引用
  with_options presence: true do
    validates :postal_code
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  # item_purchaseモデルから引用
  with_options presence: true do
    validates :user_id
    validates :item_id
  end

  # pay_itemのトークン
  with_options presence: true do
    validates :token
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)

    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_purchase_id: item_purchase.id)
  end
end
