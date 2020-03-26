class CommentsController < ApplicationController
	before_action :require_login, except: [:create, :edit]
	include CommentsHelper


	def edit

		# byebug
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])

   		respond_to do |format|
      		format.js
   		end		
	end

	def create
		
		@comment = Comment.new(comment_params)
		@comment.author_name = current_user.username
		@comment.article_id = params[:article_id]
		@comment.author_id = current_user.id
		@comment.save

		redirect_to article_path(@comment.article)
	end

	def update
		
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])

		@comment.update(comment_params)
		respond_to do |format|
	      format.html
	      format.js
		end
	end

	def destroy
		
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy

		redirect_to article_path(@article)
	end


end
