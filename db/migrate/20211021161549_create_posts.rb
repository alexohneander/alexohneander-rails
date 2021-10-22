class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.text :body
      t.string :tags
      t.boolean :published

      t.timestamps
    end
  end
end
