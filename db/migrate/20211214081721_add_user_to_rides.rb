class AddUserToRides < ActiveRecord::Migration[6.0]
  def change
    add_reference :rides, :users, null: false, foreign_key: true
  end
end
