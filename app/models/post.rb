class Post < ActiveRecord::Base
	
	validates :title, :content, presence: true

	has_attached_file :image, styles: { medium: "700x500#", small: "350x350#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :comments
end
