class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :rental_charge, :integer
    add_column :users, :role, :string
    add_column :users, :presentation, :text
  end
end
