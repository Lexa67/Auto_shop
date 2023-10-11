class DropAdminsTable < ActiveRecord::Migration[7.0]
  def change
    def up
      drop_table :admins
    end
  
    def down
      # Если необходимо, можно определить метод "down" для отмены удаления таблицы.
    end
  end
end
