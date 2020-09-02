require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Blog::ReviewsController < ApplicationController

    # Layout
    layout "phcdevworks_press/frontend"

    # INDEX
    def index
      @phcdevworks_cms_press_review_index = Review::Post.where(review_post_status: "published").order("created_at DESC")
    end

    # SHOW
    def show
      @phcdevworks_cms_press_review_single = Review::Post.friendly.find(params[:id])
    end

  end
end
