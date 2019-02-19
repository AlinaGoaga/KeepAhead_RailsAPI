# frozen_string_literal: true

class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.string :passphrase
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
