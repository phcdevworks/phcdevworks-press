require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
  class Blog::ArticlesController < ApplicationController

    # Layout
    layout "phcdevworks_press/frontend"

    # INDEX
    def index
      @phcdevworks_cms_press_article_index = Article::Post.where(article_post_status: "published").order("created_at DESC")
      @phcdevworks_cms_press_list_index = List::Post.where(list_post_status: "published").order("created_at DESC")
      @phcdevworks_cms_press_review_index = Review::Post.where(review_post_status: "published").order("created_at DESC")
    end

    # SHOW
    def show
      @phcdevworks_cms_press_article_single = Article::Post.friendly.find(params[:id])
      @phcdevworks_cms_press_list_single = List::Post.friendly.find(params[:id])
      @phcdevworks_cms_press_review_single = Review::Post.friendly.find(params[:id])
    end

  end
end
