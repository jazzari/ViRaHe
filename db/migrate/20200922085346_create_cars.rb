class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.references :simulator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
