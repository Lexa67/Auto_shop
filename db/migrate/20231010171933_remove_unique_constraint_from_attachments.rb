class RemoveUniqueConstraintFromAttachments < ActiveRecord::Migration[7.0]
  def change
    remove_index :active_storage_attachments, name: "index_active_storage_attachments_uniqueness"
  end
end
