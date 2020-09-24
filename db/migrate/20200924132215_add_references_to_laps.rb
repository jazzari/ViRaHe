class AddReferencesToLaps < ActiveRecord::Migration[5.2]
  def change
  	add_reference :laps, :user,      null: false, foreign_key: true
  	add_reference :laps, :simulator, null: false, foreign_key: true
  	add_reference :laps, :track,     null: false, foreign_key: true
  	add_reference :laps, :car,       null: false, foreign_key: true
  end
end
