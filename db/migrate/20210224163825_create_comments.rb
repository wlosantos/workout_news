class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :commenter
      t.integer :published, default: 0
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
