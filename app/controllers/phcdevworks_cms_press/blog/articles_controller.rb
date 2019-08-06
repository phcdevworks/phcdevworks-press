require_dependency "phcdevworks_cms_press/application_controller"

module PhcdevworksCmsPress
  class Blog::ArticlesController < ApplicationController

    # Layout
    layout 'phcpresspro/frontend'

    # INDEX
    def index
      @phcdevworks_cms_press_index = Article::Post.where(org_id: current_user.org_id, pststatus: "published")
    end

    # SHOW
    def show
      @phcdevworks_cms_press_single = Article::Post.friendly.find(params[:id])
    end

  end
end
