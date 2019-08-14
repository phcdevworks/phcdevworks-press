# This migration comes from phcdevworks_press (originally 20170517064427)
class CreatePhcdevworksPressCategoryVersions < ActiveRecord::Migration[6.0]
  TEXT_BYTES = 1_073_741_823
  def change

    create_table :phcdevworks_press_category_versions do |t|
      t.string   :item_type, {:null=>false}
      t.integer  :item_id,   null: false
      t.string   :event,     null: false
      t.string   :whodunnit
      t.text     :object, limit: TEXT_BYTES
      t.datetime :created_at
    end

    add_index :phcdevworks_press_category_versions, %i(item_type item_id), :name => 'press_category_versions'

  end
end
