class RemoveUniqueConstraintFromActiveStorageBlobs < ActiveRecord::Migration[7.0]
  def change
    remove_index :active_storage_blobs, name: "index_active_storage_blobs_on_key"
  end
end
