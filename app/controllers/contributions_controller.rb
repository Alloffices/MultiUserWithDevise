class ContributionsController < ApplicationController
  def create
  	@contribution = current_user.contributions.build(:user_id => params[:user_id])
  	if @contribution.save
  		flash[:notice] = "Added contributor."
  		redirect_to posts_path(@post)
  	else
  		flash[:error] = "Unable to add contributor."
  		redirect_to posts_path(@post)
  	end
  end

  def destroy
  	@contribution = current_user.contributions.find(params[:id])
  	@contribution.destroy
  		flash[:notice] = "Removed contributor."
  		redirect_to root_url
  	end
end
