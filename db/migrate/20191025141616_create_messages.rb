class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :chat_id
      t.integer :app_id
      t.text :body
      t.string :lock_version

      t.timestamps
    end
    add_index :messages, :id
  end
end
