class CreateBarkbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :barkbacks do |t|
      t.references :user, foreign_key: true
      t.references :howl, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
