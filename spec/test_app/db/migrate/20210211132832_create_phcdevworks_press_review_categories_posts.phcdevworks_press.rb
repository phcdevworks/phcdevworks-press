# This migration comes from phcdevworks_press (originally 20200716224648)
class CreatePhcdevworksPressReviewCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_review_categories_posts do |t|

      t.integer :category_id
      t.integer :post_id

    end
  end
end
