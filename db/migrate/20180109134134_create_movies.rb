class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :year
      t.text :description
      t.integer :score


      t.timestamps
    end
  end
end
