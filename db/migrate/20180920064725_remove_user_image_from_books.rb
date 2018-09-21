class RemoveUserImageFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :user_image, :string
  end
end
