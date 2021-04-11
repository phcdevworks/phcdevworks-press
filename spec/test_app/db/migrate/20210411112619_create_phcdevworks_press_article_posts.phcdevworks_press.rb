# This migration comes from phcdevworks_press (originally 20190805232522)
class CreatePhcdevworksPressArticlePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_article_posts do |t|

      t.string :article_post_title
      t.text :article_post_text
      t.string :article_post_status

      t.string :optimization_id

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
