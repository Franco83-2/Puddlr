class CreatePuddles < ActiveRecord::Migration[5.0]
  def change
    create_table :puddles do |t|
      t.datetime :departure_time
      t.integer :seats
      t.float :distance

      t.timestamps
    end
  end
end
