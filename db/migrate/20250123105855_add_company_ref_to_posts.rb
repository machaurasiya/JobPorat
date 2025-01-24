class AddCompanyRefToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :company, foreign_key: true
  end
end
