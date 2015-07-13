class WelcomeController < ApplicationController
	skip_before_filter :authenticate_user!

  def index
  @users = current_user || User.new
  end
  
  def new
    
  end
end
