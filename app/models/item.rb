class Item < ApplicationRecord
  #アクティブハッシュを使えるようにする
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  #アクティブハッシュを使えるようにする
  #アクティブストレージ
  has_one_attached :image
  #アクティブストレージ

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :state_id, numericality: { other_than: 1 }
    validates :delivery_charge_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: "Price Half-width number"}

  end

end

