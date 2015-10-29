class Contribution < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	def accept
    	self.accepted = true
  	end

end
