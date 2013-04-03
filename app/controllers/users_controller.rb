class UsersController < ApplicationController

  before_filter :load_categories

  def new
  end

  private
    
    def load_categories
       @categories = Category.all
    end 

end
