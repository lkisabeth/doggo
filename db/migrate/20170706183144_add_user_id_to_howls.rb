class AddUserIdToHowls < ActiveRecord::Migration[5.1]
  def change
    add_reference :howls, :user, foreign_key: true
  end
end
