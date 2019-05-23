class CreateWorksites < ActiveRecord::Migration[5.2]
  def change
    create_table :worksites do |t|
      t.string :name
      t.string :address
      t.text :description
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
