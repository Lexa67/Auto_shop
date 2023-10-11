class RemoveDefaultUserFromCars < ActiveRecord::Migration[7.0]
  def change
    change_column_default :cars, :user_id, nil

  end
end
