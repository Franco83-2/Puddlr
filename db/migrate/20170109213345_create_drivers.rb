class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
