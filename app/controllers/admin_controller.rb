class AdminController < ApplicationController

  respond_to :html

  before_filter :load_categories

  def index
    if !params[:category_id]
      @contents = Content.all
    else
      @contents = Content.where("category_id = ?", params[:category_id])
    end
  end

  private
    def load_categories
      @categories = Category.all
    end
end