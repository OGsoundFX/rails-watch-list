class AddCoordinatesToVideoClub < ActiveRecord::Migration[6.1]
  def change
    add_column :video_clubs, :latitude, :float
    add_column :video_clubs, :longitude, :float
  end
end
