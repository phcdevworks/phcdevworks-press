# This migration comes from phcdevworks_press (originally 20200702121306)
class RemoveImagesColsFromPhcdevworksPress < ActiveRecord::Migration[6.0]
  def change

    remove_column :phcdevworks_press_article_posts, :post_image, :string

  end
end
