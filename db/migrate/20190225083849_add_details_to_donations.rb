class AddDetailsToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :email, :string
    add_column :donations, :token, :string
    add_column :donations, :currency, :string
    add_column :donations, :description, :string
  end
end
