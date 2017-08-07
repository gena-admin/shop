class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.decimal  :amount,  precision: 8, scale: 2

      t.timestamps
    end
  end
end
