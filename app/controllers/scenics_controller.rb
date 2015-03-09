class ScenicsController < ApplicationController
	def scenics_option
		@scenic_types=ScenicType.new.get_options
		@result_text="value:\""
		@scenic_types.each do |type|
			@result_text+="#{type.id}:#{type.name};"
		end
		@result_text+="\""
		#render plain: @result_text
=begin
		respond_to do |format|
			format.html { render template: 'scenics/scenics_option.json.jbuilder' }
		end
=end
	end
end
