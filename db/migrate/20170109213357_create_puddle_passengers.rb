class CreatePuddlePassengers < ActiveRecord::Migration[5.0]
  def change
    create_table :puddle_passengers do |t|
      t.integer :puddle_id
      t.integer :passenger_id

      t.timestamps
    end
  end
end
