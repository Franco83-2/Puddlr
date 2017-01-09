class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.integer :phone

      t.timestamps
    end
  end
end
