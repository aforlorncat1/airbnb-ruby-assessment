class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :property

	def self.reset_id
		i=0
		self.find_each do |x|
			x.id = i
			x.save!
			i+=1
		end
	end
end
