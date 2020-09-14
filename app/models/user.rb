class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  

  with_options presence: true do
    validates :nickname, presence: true
    validates :password, format: { with: /[a-z\d]{8,}/i, message: "include both letters and numbers"}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters"}
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/, message: "Full-width katakana caracters"}
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width katakana caracters"}
    validates :birthday, presence: true
  end
end