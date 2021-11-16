class AddDescriptionToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :description, :text
  end
end
