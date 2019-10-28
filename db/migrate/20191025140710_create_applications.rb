class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :token
      t.integer :chats_count, :default => 0
      t.string :lock_version

      t.timestamps
    end
    add_index :applications, :token
  end
end
