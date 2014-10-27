class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
