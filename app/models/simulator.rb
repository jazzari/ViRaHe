class Simulator < ApplicationRecord
	validates :name, uniqueness: true, presence: true
end
