class CreatePhcdevworksPressAddSeo < ActiveRecord::Migration[6.0]
  def change

    add_column :phcdevworks_press_article_posts, :optimization_id, :string

  end
end
