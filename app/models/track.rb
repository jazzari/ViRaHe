class Track < ApplicationRecord
	validates :name, presence: true
  
  	belongs_to :simulator
end
