class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :location
      t.integer :user_id
      t.timestamps
    end
  end
end
