require 'test_helper'

class CartTest < ActiveSupport::TestCase

  def new_cart_with_one_product(product_name)
    cart = Cart.new
    cart.add_product(products(product_name).id)
    cart  
  end

  test "Line Items Properly Added to Cart" do
    cart = new_cart_with_one_product(:ruby)
    assert_equal 1, cart.line_items.size 
    #add a new product
    cart = cart.add_product(products(:one).id)
    assert_equal 2, cart.line_items.size
  end

  test "Adding same product updates line item" do
    cart = new_cart_with_one_product(:ruby)
    #add same product
    cart = cart.add_product(products(:ruby).id)
    assert_equal 1, cart.line_items.size
    assert_equal 2, current_item.quantity
  end

end
