class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.string :name
      t.integer :app_id
      t.integer :messages_count

      t.timestamps
    end
  end
end
