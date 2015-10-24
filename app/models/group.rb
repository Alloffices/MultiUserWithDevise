class Group < ActiveRecord::Base
	belongs_to :requester, class_name: "Post"
	belongs_to :accepted, class_name: "Post"
	validates :requester_id, presence: true
  	validates :accepted_id, presence: true
end
