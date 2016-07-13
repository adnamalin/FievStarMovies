class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.integer :rater_id
      t.integer :movie_id

      t.timestamps( null: false)
    end
  end
end
