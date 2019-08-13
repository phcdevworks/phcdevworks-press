class CreatePhcdevworksPressArticlePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_article_posts do |t|

      t.string :post_title
      t.string :post_text
      t.string :post_status
      t.string :post_image

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
