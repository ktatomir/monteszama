class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.references :user, null: false
      t.references :order, null: false
      t.timestamps
    end
    add_index :items, :order_id
    add_index :items, :user_id
    add_index :items, [:order_id, :user_id], unique: true
  end
end
