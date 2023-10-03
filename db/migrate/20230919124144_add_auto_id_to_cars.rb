class AddAutoIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :auto, null: false, foreign_key: true
  end
end
