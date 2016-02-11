class PagesController < ApplicationController

	def show
		@page = Page.find(params[:id])	
	end	

	def comment
		commentable = Page.find(params[:id])
		comment = commentable.comments.create
		comment.title = params[:title]
		comment.comment = params[:comment]
		comment.user = @user
		comment.save
		redirect_to page_url(commentable)
	end

	def like
		@page = Page.find(params[:id])

		if @user.voted_for? @page
			@page.unliked_by @user
		else
			@page.liked_by @user
		end

      	redirect_to page_url(@page)

    end
end
