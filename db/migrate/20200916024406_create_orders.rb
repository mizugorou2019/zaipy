class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string      :content,   null: :false
      t.references  :user,      null: false, foreign_key: true
      # t.integer :user_id,   null: false, foreign_key: true
      # t.integer :item_id,   null: false, foreign_key: true
      # t.integer :quantity,  null: false

      t.timestamps
    end
  end
end
