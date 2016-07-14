class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :movie_id
      t.integer :reviewer_id
      t.timestamps(null:false)
    end
  end
end
