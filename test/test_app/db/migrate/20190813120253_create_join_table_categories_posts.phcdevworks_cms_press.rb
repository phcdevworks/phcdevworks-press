# This migration comes from phcdevworks_cms_press (originally 20190315173237)
class CreateJoinTableCategoriesPosts < ActiveRecord::Migration[6.0]
  def change
    create_join_table :categories, :posts do |t|
      # t.index [:category_id, :post_id]
      # t.index [:post_id, :category_id]
    end
  end
end
