class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :gender
      t.date :date_of_birth
      t.string :address
      t.string :city
      t.string :pincode
      t.string :profile_summury
      t.string :image
    

      t.timestamps
    end
  end
end
