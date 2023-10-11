class RemoveUniqueConstraintFromActionTextRichTexts < ActiveRecord::Migration[7.0]
  def change
    remove_index :action_text_rich_texts, name: "index_action_text_rich_texts_uniqueness"
  end
end
