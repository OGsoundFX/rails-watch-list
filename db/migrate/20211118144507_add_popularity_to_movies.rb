class AddPopularityToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :popularity, :integer
  end
end
