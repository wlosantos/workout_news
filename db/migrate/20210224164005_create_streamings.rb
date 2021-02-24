class CreateStreamings < ActiveRecord::Migration[6.1]
  def change
    create_table :streamings do |t|
      t.string :title
      t.text :description
      t.integer :published, default: 0
      
      t.timestamps
    end
  end
end
