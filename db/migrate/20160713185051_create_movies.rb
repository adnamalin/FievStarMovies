class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :director
      t.string :poster
      t.date :release_date
      t.timestamps(null: false)
    end
  end
end
