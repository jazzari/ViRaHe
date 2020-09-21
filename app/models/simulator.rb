class Simulator < ApplicationRecord
	validates :name, uniqueness: true, presence: true

	has_many :tracks, dependent: :destroy
	accepts_nested_attributes_for :tracks, allow_destroy: true
end
