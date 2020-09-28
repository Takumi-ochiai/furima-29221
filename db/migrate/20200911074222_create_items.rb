class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :state_id
      t.integer :delivery_charge_id
      t.integer :shipping_area_id
      t.integer :shipping_day_id
      t.integer :price
      t.references :user, foreign_key: true
      # referencesでuser_idというカラムになるはずだが、なってないのでforeign_key: trueを追記してみる
      t.timestamps
    end
  end
end
