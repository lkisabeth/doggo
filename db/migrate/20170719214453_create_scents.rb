class CreateScents < ActiveRecord::Migration[5.1]
  def change
    create_table :scents do |t|
      t.integer :stench

      t.timestamps
    end
  end
end
