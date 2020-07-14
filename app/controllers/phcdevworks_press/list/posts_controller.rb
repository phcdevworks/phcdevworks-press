require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class List::PostsController < ApplicationController
  
    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_list_post, only: [:show, :edit, :update, :destroy]

    # GET /list/posts
    def index
      @list_posts = List::Post.all
    end

    # GET /list/posts/1
    def show
      @list_post = Article::Post.friendly.find(params[:id])
    end

    # GET /list/posts/new
    def new
      @list_post = List::Post.new
    end

    # GET /list/posts/1/edit
    def edit
    end

    # POST /list/posts
    def create
      @list_post = List::Post.new(list_post_params)
      @list_post.user_id = current_user.id
      @list_post.org_id = current_user.org_id
      respond_to do |format|
        if @list_post.save
          format.html { redirect_to list_posts_path, :flash => { :success => 'Article has been Added.' }}
          format.json { render :show, status: :created, location: @list_post }
        else
          format.html { render :new }
          format.json { render json: @list_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /list/posts/1
    def update
      respond_to do |format|
        if @list_post.update(list_post_params)
          format.html { redirect_to list_posts_path, :flash => { :notice => 'Article has been Updated.' }}
          format.json { render :show, status: :ok, location: @list_post }
        else
          format.html { render :edit }
          format.json { render json: @list_post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /list/posts/1
    def destroy
      @list_post.destroy
      respond_to do |format|
        format.html { redirect_to list_posts_path, :flash => { :error => 'Article has been Removed.' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_list_post
      @list_post = List::Post.find(params[:id])
    end

    # Whitelist
    def list_post_params
      params.require(:list_post).permit(:list_post_title, :list_post_text, :list_post_status, :slug, :optimization_id, :org_id, :user_id, category_ids: [])
    end

  end
end
