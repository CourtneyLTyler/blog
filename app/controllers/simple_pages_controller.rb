class SimplePagesController < ApplicationController

  def index
    @products = Product.all
    if params[:q]
      search_term = params[:q]
      if(Rails.env.production?)
        #Using ilike for case insensitivity on postgres
        @products = Product.where("name ilike ?", "%#{search_term}")
      else
        @products = Product.where("name LIKE ?", "%#{search_term}")
      end
    else
      @products = Product.all
    end
  end

  def landing_page
    @products = Product.limit(5)

  end

end
