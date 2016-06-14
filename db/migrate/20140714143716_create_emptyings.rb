class CreateEmptyings < ActiveRecord::Migration
  def change
    create_table :emptyings do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
