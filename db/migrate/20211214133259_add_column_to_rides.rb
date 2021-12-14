class AddColumnToRides < ActiveRecord::Migration[6.0]
  def change
    add_reference :rides, :user, null: false, foreign_key: true
  end
end
