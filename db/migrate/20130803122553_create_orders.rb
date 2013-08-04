class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :desc, null: false
      t.belongs_to :owner
      t.belongs_to :caller
      t.timestamps
    end
  end
end
