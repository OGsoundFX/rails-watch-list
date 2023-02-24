class ChangeRatingToDecimalInReviews < ActiveRecord::Migration[6.1]
  # change_column is not reversible with rails db:rollback, we need the up and down instead of change methods
  def up
    change_column :reviews, :rating, :decimal
  end

  def down
    change_column :reviews, :rating, :integer
  end
end
