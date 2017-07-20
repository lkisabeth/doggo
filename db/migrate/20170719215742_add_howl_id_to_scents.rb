class AddHowlIdToScents < ActiveRecord::Migration[5.1]
  def change
    add_reference :scents, :howl, foreign_key: true
  end
end
