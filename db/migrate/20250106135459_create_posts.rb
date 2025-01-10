class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.belongs_to :user, foreign_key: true
      t.string :description
      t.string :salary
      t.string :location

      t.timestamps
    end
  end
end
