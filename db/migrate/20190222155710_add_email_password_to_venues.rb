class AddEmailPasswordToVenues < ActiveRecord::Migration[5.2]
  def change
    add_column :venues, :email, :string
    add_column :venues, :password, :string
  end
end
