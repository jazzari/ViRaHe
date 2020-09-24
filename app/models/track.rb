class Track < ApplicationRecord
  
  	belongs_to :simulator
  	has_many :laps, dependent: :destroy

  	validates :name, presence: true

end
