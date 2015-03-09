class ScenicType < ActiveRecord::Base
	def get_options
		return ScenicType.all
	end
end
