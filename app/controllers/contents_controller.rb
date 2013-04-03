class ContentsController < ApplicationController

  respond_to :html

  before_filter :load_categories
  before_filter :logged_in?, except: [:show, :index]

  def logged_in?
    redirect_to root_path, notice: 'Vc n tem autorizacao pra ver isso' unless signed_in?
  end

  def index
    if !params[:category_id]
      @contents = Content.all
    else
      @contents = Content.where("category_id = ?", params[:category_id])
    end
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
        format.json { render json: @content, status: :created, location: @content }
      else
        format.html { render action: "new" }
        format.json { render json: @content.errors, status: :unprocessable_entity }
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

    respond_to do |format|
      format.html { redirect_to contents_url }
    end
  end

  private
    def load_categories
      @categories = Category.all
    end
end
