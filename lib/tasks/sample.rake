namespace :db do
	desc "fill some sample data"
	task sample: :environment do
		make_admins
    make_users
		make_scenics_and_tickets
		make_scenic_and_tickets_type
		make_orders
		make_menu
	end
end

def make_admins
	#创建系统管理员
	system_admin = Admin.create!(
		account: "rong",
		name: "MadisonRong",
		password: "123456",
		password_confirmation: "123456",
		admin_type: 0
		)
	#创建平台管理员
	3.times do |n|
		platform_admin=Admin.create!(
		account: "rong#{n}",
		name: "Fat.new#{n}",
		password: "123456",
		password_confirmation: "123456",
		admin_type: 1
		)
	end
	#创建商家
	99.times do |n|
		name = Faker::Name.name
		bussiness_admin=Admin.create!(
		account: "b#{n}",
		name: name,
		password: "123456",
		password_confirmation: "123456",
		admin_type: 2
		)
		bussiness=Business.create!(
			name: name,
			admin_id: bussiness_admin.id,
			operating_license: "/assets/user.jpg",
			legal_person_name: "Fat.new",
			legal_person_photo: "/assets/avatar#{rand(4)+1}.png",
			business_status: 0,
			sys_admin_id: (n%3)+2
			)
	end
end

def make_scenics_and_tickets
	99.times do |n|
		name = Faker::Name.name
		scenic=Scenic.create!(
			name: name,
			picture: "",
			manager_name: "Fat.new",
			manager_number: "123456789123456789",
			business_id: n+1
			)
		ticket=Ticket.create!(
			name: name,
			price: 1,
			scenic_id: scenic.id,
			picture: "",
			description: "",
			ticket_type: (n%3)+1,
			status: 0,
			sys_admin_id: (n%3)+2,
			business_id: n+1
			)
	end
end

def make_scenic_and_tickets_type
	tickets_type1=TicketsType.create!(name: "漂流")
	tickets_type2=TicketsType.create!(name: "滑雪")
	tickets_type3=TicketsType.create!(name: "游乐场")
	tickets_type4=TicketsType.create!(name: "温泉")
	tickets_type5=TicketsType.create!(name: "名山胜水")
	tickets_type6=TicketsType.create!(name: "古镇")
	scenic_type1=ScenicType.create!(name: "国内游")
	scenic_type2=ScenicType.create!(name: "自助游")
	scenic_type3=ScenicType.create!(name: "出境游")
	scenic_type4=ScenicType.create!(name: "游轮")
end

def make_orders
	990.times do |n|
		order = Order.create!(
      user_id: rand(99)+1,
      money: 1,
      ticket_id: rand(99)+1,
      status: 0,
      user_number: 1,
      business_id: rand(99)+1
			)
	end
end

def make_users
  99.times do |n|
    name = Faker::Name.name
    user = User.create!(
      account: "123456#{n}",
      name: name,
      password: "123456",
      password_confirmation: "123456",
      phone: "123456789#{n}",
      user_identity: 0
      )
  end
end

def make_menu
	#创建系统管理员菜单
	system_admin_menu1=Menu.create(pid: 0, name: "管理平台管理员", link: "/admins/list")
	system_admin_menu2=Menu.create(pid: 0, name: "统计平台管理员工作量", link: "/admins/workload")
	system_admin_menu_role1=MenuRole.create(menu_id: system_admin_menu1.id, role_id: 0)
	system_admin_menu_role2=MenuRole.create(menu_id: system_admin_menu2.id, role_id: 0)
	#创建平台管理员菜单
	platform_admin_menu1=Menu.create(pid: 0, name: "审核商品", link: "/admins/commodity/status_list")
	platform_admin_menu2=Menu.create(pid: 0, name: "审核商家", link: "/admins/businesses/status_list")
	platform_admin_menu3=Menu.create(pid: 0, name: "管理商家", link: "/admins/businesses/list")
	platform_admin_menu4=Menu.create(pid: 0, name: "统计商家", link: "/admins/businesses/statistics")
	platform_admin_menu_role1=MenuRole.create(menu_id: platform_admin_menu1.id, role_id: 1)
	platform_admin_menu_role2=MenuRole.create(menu_id: platform_admin_menu2.id, role_id: 1)
	platform_admin_menu_role3=MenuRole.create(menu_id: platform_admin_menu3.id, role_id: 1)
	platform_admin_menu_role4=MenuRole.create(menu_id: platform_admin_menu4.id, role_id: 1)
	#创建商家菜单
	business_menu1=Menu.create(pid: 0, name: "管理商品", link: "/admins/commodity/list")
	business_menu2=Menu.create(pid: 0, name: "统计订单", link: "/admins/orders/statistics")
	business_menu_role1=MenuRole.create(menu_id: business_menu1.id, role_id: 2)
	business_menu_role2=MenuRole.create(menu_id: business_menu2.id, role_id: 2)
end