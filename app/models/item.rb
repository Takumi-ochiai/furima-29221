class Item < ApplicationRecord
  belongs_to :user
  has_one :item_purchase

  belongs_to :user
  # アクティブハッシュを使えるようにする
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  # アクティブハッシュを使えるようにする
  # アクティブストレージ
  has_one_attached :image
  # アクティブストレージ

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
    # numericalityは数字であることの条件
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_charge_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end

  validates :price, numericality: { only_integer: true, message: 'Half-width number' }
  # validates_inclusion_ofについて
  # https://qiita.com/suzy1031/items/c3220a3749aec48d3d43
  validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'
end
