class CreateLaps < ActiveRecord::Migration[5.2]
  def change
    create_table :laps do |t|
      t.integer :time
      t.boolean :setting
      t.boolean :hardware
      t.text :notes

      t.timestamps
    end
  end
end
