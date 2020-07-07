# This migration comes from phcdevworks_press (originally 20200707115652)
class CreatePhcdevworksPressAddSeo < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_press_article_posts, :optimization_id, :string

  end
end
