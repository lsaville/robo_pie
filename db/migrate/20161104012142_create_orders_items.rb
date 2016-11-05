class CreateOrdersItems < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
