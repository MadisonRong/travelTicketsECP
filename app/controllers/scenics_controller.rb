class ScenicsController < ApplicationController
	def scenics_option
		@scenic_types=ScenicType.new.get_options
		# render plain: "[{\"key\":1,\"value\":\"123\"},{\"key\":2,\"value\":\"456\"},{\"key\":3,\"value\":\"789\"},{\"key\":4,\"value\":\"00\"}]"
	end
end
