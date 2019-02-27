class AddLatitudeAndLongitudeToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :lattitude, :float
    add_column :venues, :longitude, :float
  end
end
