class Property < ActiveRecord::Base
	has_many :bookings
	has_many :comments
	belongs_to :user

end
