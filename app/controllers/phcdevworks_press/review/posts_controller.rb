require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Review::PostsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_review_post, only: [:show, :edit, :update, :destroy]

    # GET /review/posts
    def index
      @review_posts = Review::Post.all
    end

    # GET /review/posts/1
    def show
      @review_post = Review::Post.friendly.find(params[:id])
    end

    # GET /review/posts/new
    def new
      @review_post = Review::Post.new
    end

    # GET /review/posts/1/edit
    def edit
    end

    # POST /review/posts
    def create
      @review_post = Review::Post.new(review_post_params)
      @review_post.user_id = current_user.id
      @review_post.org_id = current_user.org_id
      respond_to do |format|
        if @review_post.save
          format.html { redirect_to review_posts_path, :flash => { :success => 'Review has been Added.' }}
          format.json { render :show, status: :created, location: @review_post }
        else
          format.html { render :new }
          format.json { render json: @review_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /review/posts/1
    def update
      respond_to do |format|
        if @review_post.update(review_post_params)
          format.html { redirect_to review_posts_path, :flash => { :notice => 'Review has been Updated.' }}
          format.json { render :show, status: :ok, location: @review_post }
        else
          format.html { render :edit }
          format.json { render json: @review_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /review/posts/1
    def destroy
      @review_post.destroy
      respond_to do |format|
        format.html { redirect_to review_posts_path, :flash => { :error => 'Review has been Removed.' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_review_post
      @review_post = Review::Post.find(params[:id])
    end

    # Whitelist
    def review_post_params
     params.require(:review_post).permit(:review_post_title, :review_post_text, :review_post_status, :review_post_rating, :review_post_image, :slug, :optimization_id, :link_id, :org_id, :user_id, category_ids: [])
    end

  end
end
