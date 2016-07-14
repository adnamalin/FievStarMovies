class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :genre_id
      t.integer :movie_id
    end
  end
end
