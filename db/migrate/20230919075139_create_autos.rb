class CreateAutos < ActiveRecord::Migration[7.0]
  def change
    create_table :autos do |t|
      t.string :brand

      t.timestamps
    end
  end
end
