# This migration comes from phcdevworks_press (originally 20200712064740)
class CreatePhcdevworksPressReviewPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_review_posts do |t|

      t.string :review_post_title
      t.text :review_post_text
      t.string :review_post_status
      t.integer :review_post_rating

      t.string :optimization_id

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
