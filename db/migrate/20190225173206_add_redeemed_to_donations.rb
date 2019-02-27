class AddRedeemedToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :redeemed, :boolean
  end
end
