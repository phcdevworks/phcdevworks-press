class CreatePhcdevworksPressListPostVersions < ActiveRecord::Migration[6.0]
  TEXT_BYTES = 1_073_741_823
  def change
    create_table :phcdevworks_press_list_post_versions do |t|

      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.datetime :created_at

    end

    add_index :phcdevworks_press_list_post_versions, %i(item_type item_id), :name => 'list_post_versions'

  end
end
