class AddHumanNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :human_name, :string

    add_index :users, :human_name
  end
end
