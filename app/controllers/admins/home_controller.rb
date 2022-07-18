class Admins::HomeController < ApplicationController
  
  before_action :authenticate_admin!


  def index
   
    @payment = Payment.where(params[:id])
   
  end


end