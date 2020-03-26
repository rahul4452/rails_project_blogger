class ArticlesController < ApplicationController
	before_action :require_login, only: [:new, :create, :edit, :update, :destroy]

	include ArticlesHelper

	def index
		@article = Article.all
	end

	def show
		
		@article = Article.find(params[:id])

		#create new comment
		@comment = Comment.new
		@comment.article_id = @article.id



		@reply = Reply.new
		@reply.comment_id = @comment.id
		
	end


	def new 
		@article = current_user.articles.new
	end


	def create
		# @article = Article.new(title: params[:article][:title],
		# 	body: params[:article][:body],
		# 	description: params[:article][:description])

		# @article = Article.new(params[:article])
		
		@article = current_user.articles.new(article_params)
		
		# @article.title = params[:article][:title]
		# @article.save!
		if @article.save!
		# 	# byebug
			flash.notice = "Article #{@article.title} was created."
			redirect_to article_path(@article)
		else
		# 	# byebug
			render 'new'
		end

	end


	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article #{@article.title} was deleted."

		redirect_to articles_path
	end



	def edit
		@article = Article.find(params[:id])
	end


	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			flash.notice = "Article #{@article.title} was updated."
			redirect_to article_path(@article)
		else
			render 'edit'
			flash.notice = "Article #{@article.title} was not updated."
		end

	end

end
