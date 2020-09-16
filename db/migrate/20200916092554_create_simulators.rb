class CreateSimulators < ActiveRecord::Migration[5.2]
  def change
    create_table :simulators do |t|
      t.string :name

      t.timestamps
    end
  end
end
