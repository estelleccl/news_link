class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :headline
      t.string :submitted_by
      t.integer :tagging_id

      t.timestamps
    end
  end
end
