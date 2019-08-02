class Region < ApplicationRecord
	has_many :implementation_areas
	has_many :projects, through: :implementation_areas

    def to_s
        name
    end
    
end
