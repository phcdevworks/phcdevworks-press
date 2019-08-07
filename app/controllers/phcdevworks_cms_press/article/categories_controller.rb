require_dependency "phcdevworks_cms_press/application_controller"

module PhcdevworksCmsPress
  class Article::CategoriesController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    #before_action :authenticate_user!
    #before_action :set_paper_trail_whodunnit
    before_action :set_article_category, only: [:show, :edit, :update, :destroy]

    # GET /article/categories
    def index
      @article_categories = Article::Category.all
    end

    # GET /article/categories/1
    def show
      @article_category = Article::Category.friendly.find(params[:id])
      @versions = PhcdevworksCmsPress::CategoryVersions.where(item_id: params[:id], item_type: 'PhcdevworksCmsPress::Article::Category')
    end

    # GET /article/categories/new
    def new
      @article_category = Article::Category.new
    end

    # GET /article/categories/1/edit
    def edit
    end

    # POST /article/categories
    def create
      @article_category = Article::Category.new(article_category_params)
      respond_to do |format|
        if @article_category.save
          format.html { redirect_to article_categories_path, :flash => { :success => 'Article Category has been Added.' }}
          format.json { render :show, status: :created, location: @article_category }
        else
          format.html { render :new }
          format.json { render json: @article_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /article/categories/1
    def update
      respond_to do |format|
        if @article_category.update(article_category_params)
          format.html { redirect_to article_categories_path, :flash => { :notice => 'Article Category Name has been Updated.' }}
          format.json { render :show, status: :ok, location: @article_category }
        else
          format.html { render :edit }
          format.json { render json: @article_category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /article/categories/1
    def destroy
      @article_category.destroy
      respond_to do |format|
        format.html { redirect_to article_categories_path, :flash => { :error => 'Category and Article Connections have all been Removed.' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_article_category
      @article_category = Article::Category.friendly.find(params[:id])
    end

    # Whitelist
    def article_category_params
      params.require(:article_category).permit(:category_name, :slug, :org_id, :user_id)
    end

  end
end
