class Post < ActiveRecord::Base
	acts_as_votable
	
	validates :title, :content, presence: true
	validate :user_quota, :on => :create  
	has_attached_file :image, styles: { medium: "250x250#", small: "200x200#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :comments

	private 	

	def user_quota

		if user.posts.today.count >= 2
	     errors.add(:base, "Exceeds daily limit")

		elsif user.posts.this_week.count >= 5
	     errors.add(:base, "Exceeds weekly limit")

		end
	end

end


