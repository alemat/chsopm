module ApplicationHelper
	def percentage(value, out_of)
		return (value.to_f/out_of)*100
	end		
end
