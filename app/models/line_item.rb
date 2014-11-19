class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def item_price
    product.price
  end
end
