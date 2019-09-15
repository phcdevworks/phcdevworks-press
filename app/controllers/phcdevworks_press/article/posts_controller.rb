require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Article::PostsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_article_post, only: [:show, :edit, :update, :destroy]

    # GET /article/posts
    def index
      @article_posts = Article::Post.all
    end

    # GET /article/posts/1
    def show
      @article_post = Article::Post.friendly.find(params[:id])
      @versions = PhcdevworksPress::PostVersions.where(item_id: params[:id], item_type: 'PhcdevworksPress::Article::Post')
    end

    # GET /article/posts/new
    def new
      @article_post = Article::Post.new
    end

    # GET /article/posts/1/edit
    def edit
    end

    # POST /article/posts
    def create
      @article_post = Article::Post.new(article_post_params)
      @article_post.user_id = current_user.id
      @article_post.org_id = current_user.org_id
      respond_to do |format|
        if @article_post.save
          format.html { redirect_to article_posts_path, :flash => { :success => 'Article has been Added.' }}
          format.json { render :show, status: :created, location: @article_post }
        else
          format.html { render :new }
          format.json { render json: @article_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /article/posts/1
    def update
      respond_to do |format|
        if @article_post.update(article_post_params)
          format.html { redirect_to article_posts_path, :flash => { :notice => 'Article has been Updated.' }}
          format.json { render :show, status: :ok, location: @article_post }
        else
          format.html { render :edit }
          format.json { render json: @article_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /article/posts/1
    def destroy
      @article_post.destroy
      respond_to do |format|
        format.html { redirect_to article_posts_path, :flash => { :error => 'Article has been Removed.' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_article_post
      @article_post = Article::Post.friendly.find(params[:id])
    end

    # Whitelist
    def article_post_params
      params.require(:article_post).permit(:post_title, :post_text, :post_status, :post_image, :remove_post_image, :slug, :org_id, :user_id, category_ids: [])
    end

  end
end
