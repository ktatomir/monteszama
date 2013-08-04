class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
        t.references :user
        t.references :order
        t.timestamps
    end
    add_index :payments, :order_id
    add_index :payments, :user_id
    add_index :payments, [:order_id, :user_id], unique: true
  end
end
