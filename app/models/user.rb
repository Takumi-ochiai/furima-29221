class User < ApplicationRecord
  has_many :items
  has_many :item_purchases
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'include both letters and numbers'}

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters'} do
      validates :family_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ン]+\z/, message: 'Full-width katakana caracters'} do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end
