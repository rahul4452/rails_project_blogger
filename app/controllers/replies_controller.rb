class RepliesController < ApplicationController
	before_action :require_login, only: [:new, :create]
	include RepliesHelper

	def new
		
		@comment = Comment.find(params[:comment_id])
		
	end

	def create
		@comment = Comment.find(params[:comment_id])
		@reply = Reply.new(reply_params)
		@reply.name = current_user.username
		@reply.comment_id = params[:comment_id]
		
		if @reply.save
			redirect_to article_path(@comment.article)
			# redirect_to :back
			# byebug
			# redirect_back(fallback_location:  article_path(@comment.article))
			# redirect_to 
		else
			
			render 'new'
		end
	end

	

end
