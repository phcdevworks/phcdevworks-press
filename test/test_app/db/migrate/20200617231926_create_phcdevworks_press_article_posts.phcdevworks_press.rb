# This migration comes from phcdevworks_press (originally 20190805232522)
class CreatePhcdevworksPressArticlePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_article_posts do |t|

      t.string :post_title
      t.text :post_text
      t.string :post_status
      t.string :post_image

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
