class Menu < ActiveRecord::Base
	def Menu.get_menu(admin_type)
		#获取菜单
		menus=Menu.find_by_sql ["SELECT a.id,a.pid,a.`name`,a.link FROM menus a JOIN menu_roles b ON a.id=b.menu_id and b.role_id=? and a.pid=0", admin_type]
		#组合菜单
		total_menu=Array.new
		menus.each do |m|
			menu_items=Menu.find_by_sql ["SELECT a.id,a.`name`,a.link FROM menus a WHERE a.pid=?", m[:id]]
			menu=Hash.new
			menu[:id]=m[:id]
			menu[:pid]=m[:pid]
			menu[:name]=m[:name]
			menu[:link]=m[:link]
			if !menu_items.nil? && menu_items.length>0
				menu[:items]=menu_items
			end
			total_menu << menu
		end
		return total_menu
	end
end
