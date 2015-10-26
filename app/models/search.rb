class Search < ActiveRecord::Base
	def search_posts

	   posts = Post.all

	   posts = posts.where("title like ?", "%#{keywords}%") if keywords.present?
	   posts = posts.where("title like ?", "%#{title}%") if title.present?

	   return posts
	end
end