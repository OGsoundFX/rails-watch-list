class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user
      t.references :chatroom

      t.timestamps
    end
  end
end
