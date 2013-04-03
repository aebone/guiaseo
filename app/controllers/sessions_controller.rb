class SessionsController < ApplicationController

  before_filter :load_categories

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to admin_path
    else
      flash.now[:error] = 'E-mail ou senha nao estao ok'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private
    
    def load_categories
       @categories = Category.all
    end 

end
