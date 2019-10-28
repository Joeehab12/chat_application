class CreateChats < ActiveRecord::Migration[6.0]
    def change
        create_table :chats do |t|
            t.string :name
            t.integer :app_id
            t.integer :messages_count, :default => 0
            t.string :lock_version

            t.timestamps
        end
        add_index :chats, :id
    end
end
