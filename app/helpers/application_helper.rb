module ApplicationHelper
	#return the full title to per page
	def full_title(page_title)
		base_title = "admin.dcyy.com"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
