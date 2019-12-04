class FundingInst < ApplicationRecord
	has_many :funders

	def to_s
		name
	end
end
