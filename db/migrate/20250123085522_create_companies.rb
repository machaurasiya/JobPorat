class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :about
      t.timestamps
    end
  end
end
