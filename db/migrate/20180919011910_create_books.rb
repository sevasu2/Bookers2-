class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
    t.text "title"
    t.integer "user_id"
    t.text "opinion"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_image"
    t.timestamps
    end
  end
end
