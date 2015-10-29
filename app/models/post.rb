class Post < ActiveRecord::Base
	acts_as_votable

	validates :title, :content, presence: true

	has_attached_file :image, styles: { medium: "250x250#", small: "200x200#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :comments

	# Who wrote the post. BDD foreign key: author_id
	belongs_to :author, class_name: 'User'

	# All requests: Contributions for this post with accepted == false
	has_many :contribution_requests, -> { where(accepted: false) }, class_name: 'Contribution'

	# All accepted contributions: Contributions for this post with accepted == true
	has_many :contributions, -> { where(accepted: true) }

	# Actual contributors: all users with contributions for this post having accepted as true
	has_many :contributors, through: :contributions, source: :user

	def self.search(search)
	  if search
	    where(['name LIKE ?', "%#{search}%"])
	  else
	    all
	  end
	end

	# private 	

	# def user_quota

	# 	if user.posts.today.count >= 2
	#      errors.add(:base, "Exceeds daily limit")

	# 	elsif user.posts.this_week.count >= 5
	#      errors.add(:base, "Exceeds weekly limit")

	# 	end
	# end

end


