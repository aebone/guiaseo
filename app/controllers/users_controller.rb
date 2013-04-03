class UsersController < ApplicationController

  before_filter :load_categories
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Usuario cadastrado"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    
    def load_categories
       @categories = Category.all
    end 

end
