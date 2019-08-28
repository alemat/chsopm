class FocusArea < ApplicationRecord
	has_many :sub_focus_areas
	has_many :projects


    def to_s
        name
    end
end
