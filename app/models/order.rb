class Order < ApplicationRecord
  belongs_to :item_purchase

  # バリデーションはFormオブジェクトへ
end
