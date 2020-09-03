require_dependency "phcdevworks_press/application_controller"

module PhcdevworksPress
    class Blog::ArticlesController < ApplicationController

        # Filters
        before_action :phc_blog_index_all

        # Layout
        layout "phcdevworks_press/frontend"

        # INDEX
        def index
        end

        # SHOW
        def show
            @phcdevworks_cms_press_article_single = Article::Post.friendly.find(params[:id])
        end

        # Index All for Blog
        def phc_blog_index_all
            @phcdevworks_cms_press_article_index = Article::Post.where(article_post_status: "published").order("created_at DESC")
            @phcdevworks_cms_press_list_index = List::Post.where(list_post_status: "published").order("created_at DESC")
            @phcdevworks_cms_press_review_index = Review::Post.where(review_post_status: "published").order("created_at DESC")
        end

    end
end
