class ProgramArea < ApplicationRecord
	has_many :projects

	def to_s
		short_name
	end
end
