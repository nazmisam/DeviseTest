class Users::HomeController < ApplicationController

  def index
    before_action :authenticate_user!
  end
end