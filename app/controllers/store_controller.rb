class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      index_visit_counter
      @show_visits = show_visits
    end
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
