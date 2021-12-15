class AddPassengersUpdateToRides < ActiveRecord::Migration[6.0]
  def change
    add_column :rides, :passengers_update, :integer, default: 0
  end
end
