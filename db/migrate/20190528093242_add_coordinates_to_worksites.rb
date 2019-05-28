class AddCoordinatesToWorksites < ActiveRecord::Migration[5.2]
  def change
    add_column :worksites, :latitude, :float
    add_column :worksites, :longitude, :float
  end
end
