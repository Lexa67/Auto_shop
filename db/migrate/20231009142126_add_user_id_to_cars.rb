class AddUserIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :user, foreign_key: true, default: 4
  end
end
