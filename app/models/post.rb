class Post < ActiveRecord::Base
	acts_as_votable
	
	validates :title, :content, presence: true

	has_attached_file :image, styles: { medium: "200x200#", small: "300x300#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :comments
end
