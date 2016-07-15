class AddIndextoAssignmentsOnGenreId < ActiveRecord::Migration
  def change
    add_index :assignments, :genre_id
  end
end
