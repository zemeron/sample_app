class User < ActiveRecord::Base
	attr_accessible :name, :email
	
	validates :name, :presence => true
end

# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#
