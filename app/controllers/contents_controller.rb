class ContentsController < ApplicationController

  respond_to :html
  before_filter :load_categories

  def index
    @contents = Content.all
  end

  # GET /contents/1
  def show
    @content = Content.find(params[:id])
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
    @content = Content.find(params[:id])
  end

  # POST /contents
  def create
    @content = Content.new(params[:content])

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /contents/1
  def update
    @content = Content.find(params[:id])

    respond_to do |format|
      if @content.update_attributes(params[:content])
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /contents/1
  def destroy
    @content = Content.find(params[:id])
    @content.destroy
  end

  private
    def load_categories
      @categories = Category.all? { |e|  }
    end
end
