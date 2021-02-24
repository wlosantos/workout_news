class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :published, default: 0
      t.integer :contrast, default: 0

      t.timestamps
    end
  end
end
