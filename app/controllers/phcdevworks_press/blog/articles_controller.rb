require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Blog::ArticlesController < ApplicationController

    # Layout
    layout "phcdevworks_press/frontend"

    # INDEX
    def index
      @phcdevworks_cms_press_article_index = Article::Post.where(article_post_status: "published").order("created_at DESC")
    end

    # SHOW
    def show
      @phcdevworks_cms_press_article_single = Article::Post.friendly.find(params[:id])
    end

  end
end
