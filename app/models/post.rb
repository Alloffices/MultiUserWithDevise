class Post < ActiveRecord::Base
	acts_as_votable
	
	validates :title, :content, presence: true
	validate :user_quota, :on => :create  
	
	has_attached_file :image, styles: { medium: "250x250#", small: "200x200#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :comments

	#Join table associations
	has_many :group_requests, class_name:  "Group",
                                  foreign_key: "requester_id",
                                  dependent:   :destroy
  	has_many :group_users, class_name:  "Group",
                                   foreign_key: "accepted_id",
                                   dependent:   :destroy
	has_many :requester, through: :group_requests
	has_many :accepted, through: :group_users


	def request(other_post)
		group_requests.create(accepted_id: other_post.id)
	end

	# Unfollows a user.
	def unrequest(other_post)
		group_requests.find_by(accepted_id: other_post.id).destroy
	end

	# Returns true if the current user is following the other user.
	def accepted?(other_post)
		requesting.include?(other_post)
	end

	private

	def user_quota

		if user.posts.today.count >= 2
	     errors.add(:base, "Exceeds daily limit")

		elsif user.posts.this_week.count >= 5
	     errors.add(:base, "Exceeds weekly limit")

		end
	end

end


