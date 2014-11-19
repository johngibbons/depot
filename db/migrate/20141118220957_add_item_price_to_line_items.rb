class AddItemPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :item_price, :decimal
  end
end
