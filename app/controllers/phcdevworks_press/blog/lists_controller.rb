require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Blog::ListsController < ApplicationController

    # Layout
    layout "phcdevworks_press/frontend"

    # INDEX
    def index
      @phcdevworks_cms_press_list_index = List::Post.where(list_post_status: "published").order("created_at DESC")
    end

    # SHOW
    def show
      @phcdevworks_cms_press_list_single = List::Post.friendly.find(params[:id])
    end

  end
end
