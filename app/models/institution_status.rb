class InstitutionStatus < ApplicationRecord
	has_many :institutions

    def to_s
        name
        
    end
    
end
