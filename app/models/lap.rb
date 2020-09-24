class Lap < ApplicationRecord
	belongs_to :user 
	belongs_to :simulator 
	belongs_to :track 
	belongs_to :car 

	validates :time, presence: true, 
		numericality: { greater_than: 1999, less_than: 3600000,  only_integer: true }
	validates :setting, inclusion: { in: [ true, false ] }
	validates :hardware, inclusion: { in: [ true, false ] }
	validates :notes, length: {minimum: 5, maximum: 280}, allow_blank: true

	
end
