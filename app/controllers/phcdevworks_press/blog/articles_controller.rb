require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Blog::ArticlesController < ApplicationController

    # Layout
    layout "phcdevworks_press/frontend"

    # INDEX
    def index
      @phcdevworks_cms_press_index = Article::Post.where(post_status: "published")
    end

    # SHOW
    def show
      @phcdevworks_cms_press_single = Article::Post.friendly.find(params[:id])
    end

  end
end
