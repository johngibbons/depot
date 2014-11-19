class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def index
    @products = Product.order(:title)
    index_visit_counter
    @show_visits = show_visits
  end

  def index_visit_counter
    if session[:visits].nil?
      session[:visits] = 0
    else
      session[:visits] += 1
    end
  end

  def show_visits
    if session[:visits] > 5
      @counter = session[:visits]
    end
  end
end
