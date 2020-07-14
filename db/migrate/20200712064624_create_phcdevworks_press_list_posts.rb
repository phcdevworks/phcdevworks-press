class CreatePhcdevworksPressListPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :phcdevworks_press_list_posts do |t|

      t.string :list_post_title
      t.text :list_post_text
      t.string :list_post_status

      t.string :optimization_id

      t.string :slug
      t.string :user_id
      t.string :org_id

      t.timestamps

    end
  end
end
