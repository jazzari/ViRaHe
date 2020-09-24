class Simulator < ApplicationRecord

	has_many :tracks, dependent: :destroy
	has_many :cars, dependent: :destroy
	has_many :laps, :through=> :cars
	has_many :laps, :through=> :tracks
	
	accepts_nested_attributes_for :tracks, allow_destroy: true
	accepts_nested_attributes_for :cars, allow_destroy: true

	validates :name, uniqueness: true, presence: true
	
end
