# This migration comes from phcdevworks_press (originally 20191024232406)
class CreatePhcdevworksPressCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_categories_posts do |t|

      t.integer :category_id
      t.integer :post_id

    end
  end
end
