class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.integer :friend
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
