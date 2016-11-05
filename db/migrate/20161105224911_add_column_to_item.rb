class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :status, :string, default: 'active'
  end
end
