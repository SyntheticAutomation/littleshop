class AddColumnToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :fulfillment, :boolean, default: true
  end
end
