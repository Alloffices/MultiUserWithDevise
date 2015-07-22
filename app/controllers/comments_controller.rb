class CommentsController < ApplicationController

	before_action :set_post, only: [:create]

	def create
		@comments = Comment.create(params[:comment].permit(:body))
	end

	private

	def set_post
      @post = Post.find(params[:post_id])
	end
end
