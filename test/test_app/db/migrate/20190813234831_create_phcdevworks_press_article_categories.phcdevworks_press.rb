# This migration comes from phcdevworks_press (originally 20190805232733)
class CreatePhcdevworksPressArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_article_categories do |t|

      t.string :category_name

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
