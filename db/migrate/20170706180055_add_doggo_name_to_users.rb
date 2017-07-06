class AddDoggoNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :doggo_name, :string

    add_index :users, :doggo_name
  end
end
