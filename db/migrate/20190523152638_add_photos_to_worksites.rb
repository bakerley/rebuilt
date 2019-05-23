class AddPhotosToWorksites < ActiveRecord::Migration[5.2]
  def change
    add_column :worksites, :photo, :string
  end
end
