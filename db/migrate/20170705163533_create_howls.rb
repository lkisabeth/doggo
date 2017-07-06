class CreateHowls < ActiveRecord::Migration[5.1]
  def change
    create_table :howls do |t|
      t.string :caption

      t.timestamps null: false
    end
  end
end
