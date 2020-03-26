class TagsController < ApplicationController
	before_action :require_login, only: [:destroy]


	def index
		@tag = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		
		@tag = Tag.find(params[:id])
		# @tag.name = params[:tag][:name]
		@tag.update(:name => params[:tag][:name])

		redirect_to tags_path
	end


	def destroy
		
		@tag = Tag.find(params[:id])

		@tag.destroy
		redirect_to tags_path
	end
end
