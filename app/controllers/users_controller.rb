class UsersController < ApplicationController

  before_filter :load_categories
  before_filter :logged_in? 

  def logged_in?
    redirect_to root_path, notice: 'Vc n tem autorizacao pra ver isso' unless signed_in?
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Oi! Usuario criado com sucesso"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Perfil atualizado"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario excluido"
    redirect_to users_path
  end

  private

    def load_categories
      @categories = Category.all
    end 

end
