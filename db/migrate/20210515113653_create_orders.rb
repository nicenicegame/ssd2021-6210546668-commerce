class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.text :name
      t.text :product_name
      t.text :address

      t.timestamps
    end
  end
end
