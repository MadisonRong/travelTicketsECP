class ChangePasswordDigestsFromAdmin < ActiveRecord::Migration
  def change
  	change_table :admins do |t|
  		t.rename :password_digests, :password_digest
  	end
  end
end
