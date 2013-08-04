class AddQuantToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :quant, :float, null: false
  end
end
