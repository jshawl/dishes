class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :created_by_id
      t.integer :sent_to_id

      t.timestamps
    end
  end
end
