class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :review_id
      t.string :commenter_id
      t.timestamps(null:false)
    end
  end
end
