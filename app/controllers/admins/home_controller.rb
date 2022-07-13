class Admins::HomeController < ApplicationController
  
  before_action :authenticate_user!

end