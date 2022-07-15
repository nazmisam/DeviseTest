class Admins::HomeController < ApplicationController
  
  before_action :authenticate_admin!


  def index
    @product = Product.where(product_id)
    @payment = Payment.where(params[:id])
   
  end


end