class RemoveDatesToWorksites < ActiveRecord::Migration[5.2]
  def change
    remove_column :worksites, :start_date
    remove_column :worksites, :end_date
  end
end
