class ProgramArea < ApplicationRecord
	has_many :projects
	has_many :focus_areas

	def to_s
		name
	end
end
