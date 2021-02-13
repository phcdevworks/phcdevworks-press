class AddAffiliatelinkToArticlePosts < ActiveRecord::Migration[6.1]
  def change
    add_column :phcdevworks_press_article_posts, :link_id, :string
  end
end
