class Order < ActiveRecord::Base
  belongs_to :business
  belongs_to :ticket
  belongs_to :user

=begin
select date_format(a.created_at,'%d') day,a.business_id, count(*) mount from orders a 
join businesses b on a.business_id=b.id and b.admin_id=5
where date_format(a.created_at, '%Y-%m')=date_format(curdate(), '%Y-%m') group by day;
=end
  scope :count_order, ->(admin_id){
    includes(:business).where(:businesses => {"admin_id" => admin_id})
  }
end
