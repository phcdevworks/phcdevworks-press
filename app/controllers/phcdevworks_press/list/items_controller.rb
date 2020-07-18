require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class List::ItemsController < ApplicationController

    # Filters & Security
    #include PhcdevworksCore::PhcpluginsHelper
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit
    before_action :set_list_item, only: [:show, :edit, :update, :destroy]

    # GET /list/items
    def index
      @list_items = list_post.items.all
    end

    # GET /list/items/1
    def show
      @list_item = list_post.items.find(params[:id])
    end

    # GET /list/items/new
    def new
      @list_item = list_post.items.build
    end

    # GET /list/items/1/edit
    def edit
      @list_post = List::Post.friendly.find(params[:post_id])
    end

    # POST /list/items
    def create
      @list_item = list_post.items.create(list_item_params)
      @list_item.user_id = current_user.id
      @list_item.org_id = current_user.org_id
      respond_to do |format|
        if @list_item.save
          format.html { redirect_to list_post_items_url, :flash => { :success => 'List Item has been Added' }}
          format.json { render :show, status: :created, location: @list_item }
        else
          format.html { render :new }
          format.json { render json: @list_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /list/items/1
    def update
      @list_item = List::Item.friendly.find(params[:post_id])
      respond_to do |format|
        if @list_item.update(list_item_params)
          format.html { redirect_to list_post_items_url, :flash => { :notice => 'List Item has been Updated.' }}
          format.json { render :show, status: :ok, location: @list_item }
        else
          format.html { render :edit }
          format.json { render json: @list_item.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /list/items/1
    def destroy
      @list_item = list_post.items.find(params[:id])
      @list_item.destroy
      respond_to do |format|
        format.html { redirect_to list_post_items_url, :flash => { :error => 'Item Listing has been Removed' }}
        format.json { head :no_content }
      end
    end

    private

    # Common Callbacks
    def set_list_item
      @list_item = List::Item.find(params[:id])
    end

    def list_post
      @list_post = List::Post.friendly.find(params[:post_id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_item_params
      params.require(:list_item).permit(:list_item_title, :list_item_text, :list_item_url, :slug, :optimization_id, :org_id, :user_id, category_ids: [])
    end

  end
end
